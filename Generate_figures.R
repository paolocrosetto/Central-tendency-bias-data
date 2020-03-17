### Figures
### 
### Add to the readme

## libraries
library(tidyverse)        ## data wrangling and plotting
library(hrbrthemes)       ## ggplot theme
library(ggbeeswarm)       ## ued in Figure 1 for point jittering
library(haven)            ## to import data from Stata

## data
## data is imported from the raw Stata file
df <- read_dta("ctb_final.dta")
#df <- read_csv("centralbias_data_JoEP.csv")

## preliminary settings
theme_set(theme_ipsum_rc())   ## global theme setting

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

### Figure 2

### TODO: the figure is not exactly as the one in the paper --> it looks as if there is a problem with the labeling of treatments somewhere. To be checked

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
fig2 <- fig2 %>% 
  mutate(uniform = prob1==prob2 & prob2==prob3 & prob3==prob4 & prob4==prob5, 
         s_csp = prob1<prob2 & prob2<prob3 & prob3>prob4 & prob4>prob5,
         w_csp = prob1<=prob2 & prob2<=prob3 & prob3>=prob4 & prob4>=prob5 & prob1<prob3 & prob3>prob5,
         s_semi_csp=s_csp | (prob1<prob2 & prob2>prob3 & prob3>prob4 & prob4>prob5) | (prob1<prob2 & prob2<prob3 & prob3<prob4 & prob4>prob5),
         w_semi_csp=w_csp | (prob1<=prob2 & prob2<=prob3 & prob3<=prob4 & prob4>prob5 & prob1<prob4) | (prob1<prob2 & prob2>=prob3 & prob3>=prob4 & prob4>=prob5 & prob2>prob5))

# creatign a categorical variable to track single-peakedness
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
fig2 <- fig2 %>% 
  gather(key, value, -subjectID, -csptype, -treatfct) %>% 
  separate(key, into = c("dropme", "bin"), sep = 4) %>% 
  select(-dropme) 


# compute the share of people in each category
shares <- fig2 %>% 
  group_by(treatfct, csptype) %>% 
  summarise(n = n()) %>% 
  mutate(sumn = sum(n)) %>% 
  mutate(share = paste(round(100*n/sumn,0), "%", sep="")) %>% 
  select(treatfct, csptype, share)

# joining shares into the dataset and fine-formatting data
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


### Figure B1

### TODO: the figure depends on CQ data, that were not part of the data we submitted to the journal on round 1 of the submission. 
### TODO: we need to figure out what to do with this -- send in new, better polished data? 


