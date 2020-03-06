# Data and scripts for the "Central Tendency Bias in Belief Elicitation" by Paolo Crosetto, Antonio Filippin, Peter Katuščák and John Smith

This repository contains original data and all scripts to recreate figures and tables from the paper *Central Tendency Bias in Belief Elicitation*, forthcoming in the Journal of Economic Psychology. 

## Data description

## Variables


---------------------------------------------------------------------------------------------------------------
No   Variable         Stats / Values               Freqs (% of Valid)    Graph                                 
---- ---------------- ---------------------------- --------------------- --------------------------------------
1    subject\         Mean (sd) : 15.5 (9.1)\      32 distinct values    \                                     
     [numeric]        min < med < max:\                                  : . : .\                              
                      1 < 15 < 32\                                       : : : : : .\                          
                      IQR (CV) : 15 (0.6)                                : : : : : :\                          
                                                                         : : : : : : .\                        
                                                                         : : : : : : :                         

2    session\         Mean (sd) : 143.7 (346.1)\   15 distinct values    \                                     
     [numeric]        min < med < max:\                                  :\                                    
                      1 < 7 < 1012\                                      :\                                    
                      IQR (CV) : 6 (2.4)                                 :\                                    
                                                                         :\                                    
                                                                         : \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ :   

3    timemain\        Mean (sd) : 158.6 (111.5)\   379 distinct values   \                                     
     [numeric]        min < med < max:\                                  : .\                                  
                      21.3 < 130.3 < 837.3\                              : :\                                  
                      IQR (CV) : 123.9 (0.7)                             : :\                                  
                                                                         : : :\                                
                                                                         : : : :                               

4    choice\          Mean (sd) : 43.9 (14.6)\     67 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ \ \ \ \ : :\                      
                      1 < 42 < 90\                                       \ \ \ \ : : : .\                      
                      IQR (CV) : 23 (0.3)                                \ \ \ \ : : : :\                      
                                                                         \ \ \ \ : : : : :\                    
                                                                         \ \ : : : : : : .                     

5    value\           Mean (sd) : 80.8 (19.1)\     60  : 166 (43.8%)\    IIIIIIII \                            
     [numeric]        min < med < max:\            80  :  32 ( 8.4%)\    I \                                   
                      60 < 80 < 100\               100 : 181 (47.8%)     IIIIIIIII                             
                      IQR (CV) : 40 (0.2)                                                                      

6    timecq\          Mean (sd) : 350.2 (207.4)\   379 distinct values   \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      43.2 < 287.6 < 1169.5\                             \ \ :\                                
                      IQR (CV) : 243 (0.6)                               \ \ : :\                              
                                                                         . : : .\                              
                                                                         : : : : : . .                         

7    timeb1\          Mean (sd) : 79.2 (49.3)\     379 distinct values   \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      10.2 < 68.6 < 461\                                 : :\                                  
                      IQR (CV) : 51.7 (0.6)                              : :\                                  
                                                                         : : .\                                
                                                                         : : : :                               

8    prob1\           Mean (sd) : 14.3 (11.8)\     30 distinct values    \                                     
     [numeric]        min < med < max:\                                  :\                                    
                      0 < 14 < 100\                                      : :\                                  
                      IQR (CV) : 15 (0.8)                                : :\                                  
                                                                         : :\                                  
                                                                         : : :                                 

9    prob2\           Mean (sd) : 23 (12.2)\       36 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      0 < 20 < 75\                                       \ \ :\                                
                      IQR (CV) : 10 (0.5)                                \ \ : .\                              
                                                                         : : :\                                
                                                                         : : : : .                             

10   prob3\           Mean (sd) : 27.7 (13.7)\     38 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      0 < 24 < 100\                                      \ \ :\                                
                      IQR (CV) : 15 (0.5)                                \ \ : :\                              
                                                                         \ \ : : .\                            
                                                                         : : : : : .                           

11   prob4\           Mean (sd) : 21.3 (11.5)\     33 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      0 < 20 < 100\                                      \ \ :\                                
                      IQR (CV) : 10 (0.5)                                \ \ :\                                
                                                                         : : :\                                
                                                                         : : : . .                             

12   prob5\           Mean (sd) : 13.7 (11)\       28 distinct values    \                                     
     [numeric]        min < med < max:\                                  : .\                                  
                      0 < 14 < 90\                                       : :\                                  
                      IQR (CV) : 15 (0.8)                                : :\                                  
                                                                         : :\                                  
                                                                         : : .                                 

13   timeb2\          Mean (sd) : 57 (35)\         377 distinct values   \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      8.5 < 48.1 < 252.8\                                \ \ :\                                
                      IQR (CV) : 33.9 (0.6)                              : : :\                                
                                                                         : : :\                                
                                                                         : : : : .                             

14   cproblose\       Mean (sd) : 46 (15.9)\       50 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ \ \ \ \ \ \ :\                    
                      0 < 50 < 90\                                       \ \ \ \ \ \ \ \ :\                    
                      IQR (CV) : 21.5 (0.3)                              \ \ \ \ \ \ : : :\                    
                                                                         \ \ \ \ : : : : .\                    
                                                                         . . : : : : : .                       

15   cprobwin\        Mean (sd) : 54 (15.9)\       50 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ \ \ \ \ :\                        
                      10 < 50 < 100\                                     \ \ \ \ \ \ :\                        
                      IQR (CV) : 21.5 (0.3)                              \ \ \ \ . : : :\                      
                                                                         \ \ \ \ : : : :\                      
                                                                         . : : : : : : \ \ .                   

16   female\          Min  : 0\                    0 : 159 (41.9%)\      IIIIIIII \                            
     [numeric]        Mean : 0.6\                  1 : 220 (58.1%)       IIIIIIIIIII                           
                      Max  : 1                                                                                 

17   age\             Mean (sd) : 23.3 (3.5)\      22 distinct values    \                                     
     [numeric]        min < med < max:\                                  \ \ :\                                
                      17 < 23 < 48\                                      \ \ :\                                
                      IQR (CV) : 4 (0.2)                                 \ \ :\                                
                                                                         . :\                                  
                                                                         : : :                                 

18   siblings\        Mean (sd) : 1.3 (1.1)\       0 :  85 (22.4%)\      IIII \                                
     [numeric]        min < med < max:\            1 : 169 (44.6%)\      IIIIIIII \                            
                      0 < 1 < 7\                   2 :  85 (22.4%)\      IIII \                                
                      IQR (CV) : 1 (0.9)           3 :  27 ( 7.1%)\      I \                                   
                                                   4 :   8 ( 2.1%)\      \                                     
                                                   5 :   1 ( 0.3%)\      \                                     
                                                   6 :   3 ( 0.8%)\      \                                     
                                                   7 :   1 ( 0.3%)                                             

19   faculty\         Mean (sd) : 3.4 (1.5)\       0 :  17 ( 4.5%)\      \                                     
     [numeric]        min < med < max:\            1 :  26 ( 6.9%)\      I \                                   
                      0 < 3 < 5\                   2 :  48 (12.7%)\      II \                                  
                      IQR (CV) : 2 (0.4)           3 : 114 (30.1%)\      IIIIII \                              
                                                   4 :  37 ( 9.8%)\      I \                                   
                                                   5 : 137 (36.1%)       IIIIIII                               

20   soep\            Mean (sd) : 5 (2.1)\         1  : 12 ( 3.2%)\      \                                     
     [numeric]        min < med < max:\            2  : 32 ( 8.4%)\      I \                                   
                      1 < 5 < 10\                  3  : 62 (16.4%)\      III \                                 
                      IQR (CV) : 4 (0.4)           4  : 56 (14.8%)\      II \                                  
                                                   5  : 54 (14.2%)\      II \                                  
                                                   6  : 60 (15.8%)\      III \                                 
                                                   7  : 56 (14.8%)\      II \                                  
                                                   8  : 35 ( 9.2%)\      I \                                   
                                                   9  :  9 ( 2.4%)\      \                                     
                                                   10 :  3 ( 0.8%)                                             

21   complex\         Mean (sd) : 3.6 (2.6)\       11 distinct values    \                                     
     [numeric]        min < med < max:\                                  :\                                    
                      0 < 3 < 10\                                        : .\                                  
                      IQR (CV) : 4.5 (0.7)                               : : .\                                
                                                                         : : : . : . . .\                      
                                                                         : : : : : : : : .                     

22   BRETw\           Min  : 0\                    0 : 317 (83.6%)\      IIIIIIIIIIIIIIII \                    
     [numeric]        Mean : 0.2\                  1 :  62 (16.4%)       III                                   
                      Max  : 1                                                                                 

23   Auct100w\        Min  : 0\                    0 : 319 (84.2%)\      IIIIIIIIIIIIIIII \                    
     [numeric]        Mean : 0.2\                  1 :  60 (15.8%)       III                                   
                      Max  : 1                                                                                 

24   Auct100wo\       Min  : 0\                    0 : 320 (84.4%)\      IIIIIIIIIIIIIIII \                    
     [numeric]        Mean : 0.2\                  1 :  59 (15.6%)       III                                   
                      Max  : 1                                                                                 

25   AsyAuct80\       Min  : 0\                    0 : 347 (91.6%)\      IIIIIIIIIIIIIIIIII \                  
     [numeric]        Mean : 0.1\                  1 :  32 ( 8.4%)       I                                     
                      Max  : 1                                                                                 

26   AsyAuct60\       Min  : 0\                    0 : 324 (85.5%)\      IIIIIIIIIIIIIIIII \                   
     [numeric]        Mean : 0.1\                  1 :  55 (14.5%)       II                                    
                      Max  : 1                                                                                 

27   SymAuct60\       Min  : 0\                    0 : 320 (84.4%)\      IIIIIIIIIIIIIIII \                    
     [numeric]        Mean : 0.2\                  1 :  59 (15.6%)       III                                   
                      Max  : 1                                                                                 

28   Focal60\         Min  : 0\                    0 : 327 (86.3%)\      IIIIIIIIIIIIIIIII \                   
     [numeric]        Mean : 0.1\                  1 :  52 (13.7%)       II                                    
                      Max  : 1                                                                                 

29   Treatment\       Mean (sd) : 3.9 (2.1)\       1 : 62 (16.4%)\       III \                                 
     [numeric]        min < med < max:\            2 : 60 (15.8%)\       III \                                 
                      1 < 4 < 7\                   3 : 59 (15.6%)\       III \                                 
                      IQR (CV) : 4 (0.5)           4 : 32 ( 8.4%)\       I \                                   
                                                   5 : 55 (14.5%)\       II \                                  
                                                   6 : 59 (15.6%)\       III \                                 
                                                   7 : 52 (13.7%)        II                                    

30   RespInv100\      Min  : 0\                    0 : 111 (29.3%)\      IIIII \                               
     [numeric]        Mean : 0.7\                  1 : 268 (70.7%)       IIIIIIIIIIIIII                        
                      Max  : 1                                                                                 

31   AbsDist\         Mean (sd) : 43.9 (37.5)\     35 distinct values    \                                     
     [numeric]        min < med < max:\                                  :\                                    
                      0 < 40 < 160\                                      :\                                    
                      IQR (CV) : 69 (0.9)                                : . :\                                
                                                                         : : : :\                              
                                                                         : : : : . :                           

32   StrictSinPeak\   Min  : 0\                    0 : 301 (79.4%)\      IIIIIIIIIIIIIII \                     
     [numeric]        Mean : 0.2\                  1 :  78 (20.6%)       IIII                                  
                      Max  : 1                                                                                 

33   WeakSinPeak\     Min  : 0\                    0 : 231 (61.0%)\      IIIIIIIIIIII \                        
     [numeric]        Mean : 0.4\                  1 : 148 (39.1%)       IIIIIII                               
                      Max  : 1                                                                                 

34   Correct\         Min  : 0\                    0 : 275 (72.6%)\      IIIIIIIIIIIIII \                      
     [numeric]        Mean : 0.3\                  1 : 104 (27.4%)       IIIII                                 
                      Max  : 1                                                                                 

35   ChiSqrPvalue\    Mean (sd) : 0.3 (0.4)\       102 distinct values   \                                     
     [numeric]        min < med < max:\                                  :\                                    
                      0 < 0 < 1\                                         :\                                    
                      IQR (CV) : 1 (1.5)                                 :\                                    
                                                                         : \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ :\  
                                                                         : \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ :   

36   SigAt5per\       Min  : 0\                    0 : 130 (34.3%)\      IIIIII \                              
     [numeric]        Mean : 0.7\                  1 : 249 (65.7%)       IIIIIIIIIIIII                         
                      Max  : 1                                                                                 

37   SigAt1Per\       Min  : 0\                    0 : 144 (38.0%)\      IIIIIII \                             
     [numeric]        Mean : 0.6\                  1 : 235 (62.0%)       IIIIIIIIIIII                          
                      Max  : 1                                                                                 

38   SigAtPt01Per\    Min  : 0\                    0 : 168 (44.3%)\      IIIIIIII \                            
     [numeric]        Mean : 0.6\                  1 : 211 (55.7%)       IIIIIIIIIII                           
                      Max  : 1                                                                                 

39   end\             1\. end                      379 (100.0%)          IIIIIIIIIIIIIIIIIIII                  
     [character]                                                                                               
---------------------------------------------------------------------------------------------------------------

## How to rerun the analysis
