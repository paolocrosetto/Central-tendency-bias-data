/*
*******************************************************************************
     Tables for the paper "Central Tendency Bias in Belief Elicitation

      by Paolo Crosetto, Antonio Filippin, Peter Katuščák, John Smith

                Journal of Economic Psychology, 2020

  This file generates all the numbers to be found in the tables of the paper

                       Runs in Stata 12 or higher
*******************************************************************************
*/


** Data loading
clear
set more off


** note: locate the file with respect to this script and set the path of the file accordingly
** this script works if the .dta is in the same folder of the .do and you run Stata from the same location

use cbt_final

*******************************************************************************
** ANALYSIS

** Table 1: Summary statistics
tabstat prob1-prob5, by(treatment) stat(mean) format(%9.2f)


** Table 2: Non-uniformity & distance from the uniform
g byte cons=1
g byte uniform   =prob1==prob2 & prob2==prob3 & prob3==prob4 & prob4==prob5 
g byte nonuniform=1-uniform
g Prob1=prob1
g Prob2=prob1+prob2
g Prob3=prob1+prob2+prob3
g Prob4=prob1+prob2+prob3+prob4
g Prob5=100 
g distance=max(abs(Prob1-20),abs(Prob2-40),abs(Prob3-60),abs(Prob4-80))
g byte d10=distance>=10
g byte d20=distance>=20
g byte d30=distance>=30

label var cons "Constant"
label var uniform "Uniform response"
label var nonuniform "Non-uniform response"
forvalues i=1/5 {
	label var Prob`i' "Cummulative reported probability up to the upper end of bin `i'"
	}
label var distance "Sup norm distance of the stated belief from the uniform"
forvalues i=10(10)30 {
	label var d`i' "Sup-norm distance from uniform at least `i'"
	}

tabstat nonuniform d10 d20 d30 cons, by(treatment)   stat(sum mean) format(%9.3g)


** Table 3: Distribution of peaked responses
g byte s_csp     =prob1<prob2 & prob2<prob3 & prob3>prob4 & prob4>prob5
g byte w_csp     =prob1<=prob2 & prob2<=prob3 & prob3>=prob4 & prob4>=prob5 & prob1<prob3 & prob3>prob5
g byte s_semi_csp=s_csp | (prob1<prob2 & prob2>prob3 & prob3>prob4 & prob4>prob5) | (prob1<prob2 & prob2<prob3 & prob3<prob4 & prob4>prob5)
g byte w_semi_csp=w_csp | (prob1<=prob2 & prob2<=prob3 & prob3<=prob4 & prob4>prob5 & prob1<prob4) | (prob1<prob2 & prob2>=prob3 & prob3>=prob4 & prob4>=prob5 & prob2>prob5)

label var s_csp "Strict CSP response"
label var w_csp "Weak CSP response"
label var s_semi_csp "Strict semi-CSP response"
label var w_semi_csp "Weak semi-CSP response"

tabstat s_csp-w_semi_csp cons, by(treatment) stat(sum mean) format(%9.3g)


** Table 4: Bin weight comparisons
ttest prob2=prob1
ttest prob3=prob2
ttest prob4=prob3
ttest prob5=prob4
signrank prob2=prob1
signrank prob3=prob2
signrank prob4=prob3
signrank prob5=prob4


** Table 5: Belief type by CQ mistakes
g byte extreme_left =prob1>=prob2 & prob2>=prob3 & prob3>=prob4 & prob4>=prob5 & prob1>prob5
g byte extreme_right=prob1<=prob2 & prob2<=prob3 & prob3<=prob4 & prob4<=prob5 & prob1<prob5
g byte extreme=extreme_left+extreme_right
g byte other=1-uniform-w_semi_csp-extreme
g byte belief_type=0*uniform+1*w_semi_csp+2*extreme+3*other
label define belief_type 0 "Uniform" 1 "Weak-Semi-CSP" 2 "Extreme" 3 "Other"
label values belief_type belief_type

label var extreme_left "Extreme-left response"
label var extreme_right "Extreme-right response"
label var extreme "Extreme response"
label var other "Other response (non-uniform, non-weak-CSP, non-extreme)"
label var belief_type "Belief type"

tab belief_type

g byte wrongq1pos=wrongq1a+wrongq1b+wrongq1c+wrongq1d>0
g byte wrongq2pos=wrongq2a+wrongq2b+wrongq2c+wrongq2d>0
g byte wrongq3pos=wrongq3a+wrongq3b+wrongq3c+wrongq3d+wrongq3e>0
g byte wrongq3cpos=wrongq3c>0
g byte wrongq4pos=wrongq4>0
g byte wrongq5pos=wrongq5>0
g byte wrongqpos=wrongq1pos | wrongq2pos | wrongq3pos | wrongq4pos | wrongq5pos

foreach x in q1 q2 q3 q3c q4 q5 {
	label var wrong`x'pos "Positive # of wrong responses to c`x'"
	}
label var wrongqpos "Positive # of wrong responses to any cq"

tab belief_type wrongqpos  , column chi2
tab belief_type wrongq3pos , column chi2
tab belief_type wrongq3cpos, column chi2


** Table 6: Rank correlations
g objprob = bid if treatment<=5
replace objprob = bid*100/60 if treatment==6 | treatment==7
label var objprob "Objective probability of winning"

count if bid>=value 

g byte  zeroprob=0 
replace zeroprob=1 if              objprob<=20 & Prob1==0
replace zeroprob=1 if 20<objprob & objprob<=40 & Prob2==0
replace zeroprob=1 if 40<objprob & objprob<=60 & Prob3==0
replace zeroprob=1 if 60<objprob & objprob<=80 & Prob4==0
label var zeroprob "Zero probability of winning the auction"
list treatment prob1-prob5 bid objprob if zeroprob
replace zeroprob=0 in 238

g byte  reducebid=0
replace reducebid=1 if 20<objprob & objprob<=40 & Prob1>0 & prob2==0
replace reducebid=1 if 40<objprob & objprob<=60 & Prob2>0 & prob3==0
replace reducebid=1 if 60<objprob & objprob<=80 & Prob3>0 & prob4==0
replace reducebid=1 if 80<objprob               & Prob4==100
label var reducebid "Could reduce bid without affecting a positive probability of winning"
list treatment prob1-prob5 bid objprob if reducebid

g byte wrongbid= zeroprob | reducebid
label var wrongbid "Externally inconsistent response"

tab wrongbid

spearman objprob Prob1 if ~wrongbid
spearman objprob Prob2 if ~wrongbid
spearman objprob Prob3 if ~wrongbid
spearman objprob Prob4 if ~wrongbid

spearman objprob Prob1 if nonuniform & ~wrongbid
spearman objprob Prob2 if nonuniform & ~wrongbid
spearman objprob Prob3 if nonuniform & ~wrongbid
spearman objprob Prob4 if nonuniform & ~wrongbid

spearman objprob Prob1 if w_semi_csp & ~wrongbid
spearman objprob Prob2 if w_semi_csp & ~wrongbid
spearman objprob Prob3 if w_semi_csp & ~wrongbid
spearman objprob Prob4 if w_semi_csp & ~wrongbid

spearman objprob Prob1 if nonuniform & ~w_semi_csp & ~wrongbid
spearman objprob Prob2 if nonuniform & ~w_semi_csp & ~wrongbid
spearman objprob Prob3 if nonuniform & ~w_semi_csp & ~wrongbid
spearman objprob Prob4 if nonuniform & ~w_semi_csp & ~wrongbid


** Table 7: Belief consistency
g byte  con0=0
replace con0=1 if                 probwin<=Prob1              & objprob<=20 
replace con0=1 if Prob1<probwin & probwin<=Prob2 & 20<objprob & objprob<=40 
replace con0=1 if Prob2<probwin & probwin<=Prob3 & 40<objprob & objprob<=60
replace con0=1 if Prob3<probwin & probwin<=Prob4 & 60<objprob & objprob<=80  
replace con0=1 if Prob4<probwin                  & 80<objprob    
label var con0 "Consistency of stated beliefs and stated probability of winning"

g byte  con1=0
replace con1=1 if              probwin<=20              & objprob<=20  
replace con1=1 if 20<probwin & probwin<=40 & 20<objprob & objprob<=40  
replace con1=1 if 40<probwin & probwin<=60 & 40<objprob & objprob<=60  
replace con1=1 if 60<probwin & probwin<=80 & 60<objprob & objprob<=80  
replace con1=1 if 80<probwin               & 80<objprob               
label var con1 "Consistency of uniform beliefs and stated probability of winning"

g byte  con2=0
replace con2=1 if                 objprob<=Prob1              & objprob<=20 
replace con2=1 if Prob1<objprob & objprob<=Prob2 & 20<objprob & objprob<=40 
replace con2=1 if Prob2<objprob & objprob<=Prob3 & 40<objprob & objprob<=60
replace con2=1 if Prob3<objprob & objprob<=Prob4 & 60<objprob & objprob<=80  
replace con2=1 if Prob4<objprob                  & 80<objprob    
label var con2 "Consistency of stated beliefs and objective probability of winning"

g byte noncon0=1-con0
g byte noncon0_fix1=noncon0 & con1
g byte noncon0_fix2=noncon0 & con2
g byte noncon0_fix12=noncon0 & (con1 | con2)
g byte noncon_final=noncon0 & ~con1 & ~con2
g byte Other=nonuniform & ~w_semi_csp

label var noncon0 "Inconsistent beliefs"
label var noncon0_fix1 "Inconsistent beliefs, consistent after correction 1"
label var noncon0_fix2 "Inconsistent beliefs, consistent after correction 2"
label var noncon0_fix12 "Inconsistent beliefs, consistent after either correction 1 or correction 2"
label var noncon_final "Inconsistent beliefs, inconsistent even after either of the two corrections"
label var Other "Other response (non-uniform, non-weak-CSP)"

foreach x of varlist cons uniform nonuniform w_semi_csp Other {
	disp "`x'"
	tabstat con0 noncon0 noncon0_fix1 noncon0_fix2 noncon0_fix12 noncon_final cons if `x', stat(sum mean) format(%9.3g)
	}

** Table B1: Summary statistics
tabstat prob1-prob5, by(wrongq3cpos) stat(mean) format(%9.2f) nototal
tab wrongq3cpos
reg prob1 wrongq3cpos, robust
reg prob2 wrongq3cpos, robust
reg prob3 wrongq3cpos, robust
reg prob4 wrongq3cpos, robust
reg prob5 wrongq3cpos, robust


** Table B2: Non-uniformity & distance from the uniform
tabstat nonuniform d10 d20 d30 cons if ~wrongq3cpos, stat(sum mean) format(%9.3g)
tabstat nonuniform d10 d20 d30 cons if  wrongq3cpos, stat(sum mean) format(%9.3g)
reg nonuniform wrongq3cpos, robust
reg d10 wrongq3cpos, robust
reg d20 wrongq3cpos, robust
reg d30 wrongq3cpos, robust


** Table B4 (unreported): Bin weight comparisons
ttest prob2=prob1 if ~wrongq3cpos
ttest prob3=prob2 if ~wrongq3cpos
ttest prob4=prob3 if ~wrongq3cpos
ttest prob5=prob4 if ~wrongq3cpos
signrank prob2=prob1 if ~wrongq3cpos
signrank prob3=prob2 if ~wrongq3cpos
signrank prob4=prob3 if ~wrongq3cpos
signrank prob5=prob4 if ~wrongq3cpos

ttest prob2=prob1 if wrongq3cpos
ttest prob3=prob2 if wrongq3cpos
ttest prob4=prob3 if wrongq3cpos
ttest prob5=prob4 if wrongq3cpos
signrank prob2=prob1 if wrongq3cpos
signrank prob3=prob2 if wrongq3cpos
signrank prob4=prob3 if wrongq3cpos
signrank prob5=prob4 if wrongq3cpos
