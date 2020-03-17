# Data and scripts for the "Central Tendency Bias in Belief Elicitation" by Paolo Crosetto, Antonio Filippin, Peter Katuščák and John Smith

This repository contains original data and all scripts to recreate figures and tables from the paper *Central Tendency Bias in Belief Elicitation*, forthcoming in the Journal of Economic Psychology. 

## The paper

In the paper we document that players instructed about a uniform distribution and having passed control questions about it still hold central-single peaked *subjective* beliefs. This result is robust and cannot be imputed to mistakes and misunderstandings, the chosen elicitation mechanism, risk aversion, hedging,nor inconsistency. We provide indicative evidence that such subject beliefs can be rationalized by well-defined subjective beliefs that differ from the objective truth.

The paper can be find here : <<*add JoEcoPsy link when available*>>.

The working paper version of the paper can be found here: <<*add preprint link when availble*>>

## Data description

We conduct an experiment where 379 subjects engage in a first-price auction. Subjects are told the distribution of their random-draw opponent’s strategy: a uniform distribution on a range of possible integer bids. The subjects then place a bid in the auction. Subsequently, subjects are given an incentivized elicitation of their beliefs of the random-draw opponent’s strategy and their beliefs of winning the auction. The random-draw
opponent’s bid is determined by a physical draw of a token at the end of the experiment. 

Subjects go through a series of control questions to ensure understanding of the instructions for the experiment and of the uniform distribution.

After submitting a bid in the auction, subjects report their beliefs of the distribution of their random-draw opponent’s strategy. The strategy space of the random-draw opponent is divided into 5 bins of equal size. Subjects allocate probability weights into the bins. An automatic checker verifies that these amounts correctly sum to 100. Screenshots of the elicitation procedure are provided in Appendix D.6 The maximum that subjects
can earn on this task is 20 ECUs, where 1 ECU = 0.20 Euro.

This dataset contains all the data from our experiment. It oontains data from 379 subjects. Data include: demographics, the probabilities assigned to each bin, the auction treatments, and number of mistakes and time spent on the control questions. 


## Variables

The variables are described in detail in the `variable_description.txt` file. Here just a quick recapof the *main* and most important variables:



## How to rerun the analysis
