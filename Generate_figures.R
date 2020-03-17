### Figures for the paper "Central Tendency Bias in Belief Elicitation
### 
### by Paolo Crosetto, Antonio Filippin, Peter Katuscak, John Smith
###
### Journal of Economic Psychology, 2020
###
### This file generates all the figures of the paper
### It needs only standard libraries downloadable from CRAN
###

## sessionInfo()
# R version 3.6.1 (2019-07-05)
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] haven_2.2.0      ggbeeswarm_0.6.0 hrbrthemes_0.8.0 forcats_0.5.0    stringr_1.4.0    dplyr_0.8.5      purrr_0.3.3      readr_1.3.1     
# [9] tidyr_1.0.2      tibble_2.1.3     ggplot2_3.3.0    tidyverse_1.3.0 

## libraries
library(tidyverse)        ## data wrangling and plotting
library(hrbrthemes)       ## ggplot theme
library(ggbeeswarm)       ## ued in Figure 1 for point jittering
library(haven)            ## to import data from Stata

## data -- is imported from the raw Stata file
df <- read_dta("ctb_final.dta")

## preliminary settings
theme_set(theme_ipsum_rc())   ## global theme setting

#################
## Figure 1

# selecting relevant variables
fig1 <- df %>% 
  select(prob1, prob2, prob3, prob4, prob5)

# gathering and getting data ready for plotting
#
# 'gather()' formats data in long format
# 'separate()' and 'mutate()' generate a well-formatted Bin variable and a unique subjectID
fig1 <- fig1 %>% 
  gather(key, value) %>% 
  separate(key, into = c("dropme", "bin"), sep = 4) %>% 
  select(-dropme) %>% 
  mutate(bin = paste0("Bin ", bin))

# plotting
#
# 'quasirandom()' is a convenient means to offset points within categories to reduce overplotting. Adds only horizontal (i.e. irrelevant) jitter
# 'boxplot()' overlays a boxplot
# 'scale_...()' changes the axis values to convenient values
fig1 %>% 
  ggplot()+
  geom_quasirandom(aes(bin, value), varwidth = T, color = "grey30")+
  geom_boxplot(aes(bin, value), color = "grey50", alpha = 0.1)+  
  scale_y_continuous(breaks = c(0,20,40,60,80,100))+
  labs(x = "", 
       y = "Probability points assigned to each bin")
ggsave("Figures/Figure_1.png", width = 10, height = 7, units = "in")

# cleaning up
rm(fig1)



#################
### Figure 2

# selecting needed variables and generating meaningful subjectID
fig2 <- df %>% 
  select(subject, session, treatment, prob1, prob2, prob3, prob4, prob5) %>% 
  mutate(subjectID = session*100+subject)

# generating human-readable treatments
fig2 <- fig2 %>% 
  mutate(treatfct = fct_recode(as.factor(as.character(treatment)),
                               "Auction 100/100" = "1",
                               "Auction 100/100 w/o" = "2",
                               "BRET" = "3",
                               "Auction 80/100" = "4",
                               "Auction 60/100" = "5", 
                               "Auction 60/60" = "6",
                               "Auction 60/60 expand" = "7"))

# generating categories of single-peakedness
#
# see paper for details
fig2 <- fig2 %>% 
  mutate(uniform = prob1==prob2 & prob2==prob3 & prob3==prob4 & prob4==prob5, 
         s_csp = prob1<prob2 & prob2<prob3 & prob3>prob4 & prob4>prob5,
         w_csp = prob1<=prob2 & prob2<=prob3 & prob3>=prob4 & prob4>=prob5 & prob1<prob3 & prob3>prob5,
         s_semi_csp=s_csp | (prob1<prob2 & prob2>prob3 & prob3>prob4 & prob4>prob5) | (prob1<prob2 & prob2<prob3 & prob3<prob4 & prob4>prob5),
         w_semi_csp=w_csp | (prob1<=prob2 & prob2<=prob3 & prob3<=prob4 & prob4>prob5 & prob1<prob4) | (prob1<prob2 & prob2>=prob3 & prob3>=prob4 & prob4>=prob5 & prob2>prob5))


# creating a categorical variable to track single-peakedness
fig2$csptype <- "Other"
fig2$csptype[fig2$uniform == 1] <- "Uniform"
fig2$csptype[fig2$w_semi_csp == 1] <- "Weak-Semi-CSP"
fig2$csptype[fig2$w_csp == 1] <- "Weak-CSP"
fig2$csptype[fig2$s_semi_csp == 1] <- "Strict-Semi-CSP"
fig2$csptype[fig2$s_csp == 1] <- "Strict-CSP"

# selecting only relevant variables
fig2 <- fig2 %>% 
  select(subjectID, treatfct, starts_with("prob"), csptype)

# gathering to format data for plotting
#
# 'gather()' formats data in long format
# 'separate()' splits a vriable in two and then drops the unneded part
fig2 <- fig2 %>% 
  gather(key, value, -subjectID, -csptype, -treatfct) %>% 
  separate(key, into = c("dropme", "bin"), sep = 4) %>% 
  select(-dropme) 


# compute the share of people in each category
#
# 'summarise()' computes numerosity of each group
# the 'mutate()' calls compute relative frequency and make it human-readable
shares <- fig2 %>% 
  group_by(treatfct, csptype) %>% 
  summarise(n = n()) %>% 
  mutate(sumn = sum(n)) %>% 
  mutate(share = paste(round(100*n/sumn,0), "%", sep="")) %>% 
  select(treatfct, csptype, share)

# joining shares into the dataset and fine-formatting data
#
# 'left_join()' joins the two dataframes
# 'fct_relevel()' allows to reorder the levels of the categorical variable
# 'filter()' excludes the uniform subjects, as they ar uninteresting for the plot
fig2 <- fig2 %>%   
  left_join(shares) %>% 
  mutate(csptype = as.factor(csptype)) %>% 
  mutate(csptype = fct_relevel(csptype, "Strict-CSP", "Strict-Semi-CSP", "Weak-CSP", "Weak-Semi-CSP")) %>% 
  filter(csptype != "Uniform")

# plotting
fig2 %>% 
  ggplot(aes(bin, value, group = subjectID))+
  geom_line(alpha = 0.5)+
  scale_y_continuous(breaks = c(0,20,40,60,80,100))+
  facet_grid(treatfct~csptype)+
  geom_label(aes(x = 0.1, y = 100, label = share), hjust = 0, vjust = 1, label.size = 0.15, size = 3.5)+
  xlab("Bins")+
  ylab("Probability points")+
  theme(panel.grid.minor.y = element_blank())
ggsave("Figures/Figure_2.png", width = 12, height = 15, units = "in")


#################
### Figure B1

# Creating a dummy for subjects making mistakes in Control Question 3c
#
# 'fct_recode()' renames levels of the dummy to human-readale format
df <- df %>% 
  mutate(error3c = wrongq3c > 0) %>% 
  mutate(error3c = as.factor(error3c)) %>% 
  mutate(error3c = fct_recode(error3c, "No mistakes" = "FALSE", "Some mistakes" = "TRUE"))

# plotting
#
# first part generates mean probability points by mistake and bin
# second part (from 'ggplot()' onwards) plots the results of the computations
df %>% 
  select(error3c, "Bin 1" = prob1, "Bin 2" = prob2, "Bin 3" = prob3, "Bin 4" = prob4, "Bin 5" = prob5) %>%  
  gather(key, value, -error3c) %>% 
  group_by(error3c, key) %>% 
  summarise(prob = mean(value)) %>% 
  ggplot(aes(key, prob, group = error3c, linetype = error3c))+
  geom_line(size = 0.8)+
  geom_hline(yintercept = 20, color = 'grey50', linetype = 'dashed')+
  ylim(c(10,30))+
  theme(legend.title = element_blank(),legend.position = "bottom",
        panel.grid.minor.y = element_blank())+
  labs(y = "Probability points", x = "")
ggsave("Figures/Figure_B1.png", width = 6, height = 5, units = "in", dpi = 300)  
