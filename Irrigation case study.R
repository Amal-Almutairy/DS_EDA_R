# Irrigation analysis
# Amal Almutairy
# 03.10.2020
# Small case study using irrigation_wide in the data frame 

library(tidyverse)


# begin with wide "messy" format:
irrigation <- read.csv("~/DataProject/Misk-Amal-2020/irrigation_wide.csv") 




# Examine the data:
 str(irrigation)
 summary(irrigation)
 mutate(irrigation)
 
 
# In 2007 what the total area under irrigation?
 irrigation %>% 
   filter(year == 2007) %>% 
 select(`N..America`,`S..America`) %>% 
   sum()
 
 
#for only the Americas
irrigation %>% 
   filter(year == 2007) %>% 
   select(ends_with("erica"))

 
# Summary 
irrigation_wide %>% 
   filter(year == 2007) + 
   select(`N. America`,`S. America`) %>% 
   summary()

# Tidy Data
irrigation_t <- irrigation %>%
  pivot_longer(-year, names_to = "region", values_to = "value")
  irrigation

# What is the total under irrigation each year?
#which 2 region increased most from 1980 to 2007:
# arrange from highest to lowest use "_"
  irrigation %>%
  group_by(region) %>% 
  summarise(diff = value[year == 2007] - value[year == 1980]) %>% 
  arrange(-diff) %>% 
  slice(1:2)




# other way
# slice_max(diff, n=2)
irrigation <- irrigation %>%
    arrange(., region) %>% 
    group_by(region) %>% 
    summarise(diff = value[year == 1980] / value[year == 2007]) %>% 
    slice_max(diff, n = 2)
  

# standardizes area against 1980(relative change over 1980)
 irrigation %>% 
  group_by(year) %>% 
mutate(total_ = sum(value)) %>% 
  select(year, total_) %>% 
  transmute(total_1 = total_ / 62)


# our use top_n()
irrigation <- irrigation %>%
  arrange(region) 
  group_by(region) %>% 
  summarise(diff = value[year == 1980] / value[year == 2007]) %>% 
  slice_max(diff, n = 2)

# what is the rate of change in each region (maybe tricky)
xx <- c(1, 1.2, 1.6, 1.1)
xx
diff(xx)/xx[-lenght(xx)]

# There are the absolute differences
# How about the proportional?
irrigation <- irrigation %>%
  arrange(region) %>% 
  group_by(region) %>% 
  summarise(diff = value[year == 1980] / value[year == 2007]) %>% 
  mutate(rate = c(0, diff(vlue)/value[-lenght(value)]))



C(0, diff(xx))
(1.2-1)/1
(1.6-1.2)/1.2
(1.1-1.6)/1.6


diff(xx)/xx[-length(xx)]

irrigation_t %>%
  group_by(region) %>% 
  mutate(diff(value))


# where is it ?the highest and lowest?
irrigation_t[which.max(irrigation_t$rate),]
irrigation_t[which.min(irrigation_t$rate),]

#This will give the max rate for EACH region
irrigation_t %>% 
  slice_max(rate, n = 1)


# Because.... the tibble is STILL a group_df
diff(xx)
xx[1] - xx[2]
diff(xx)/xx[-length(xx)]


  
# plot area over time for each region?
# plot it:




# Keep all values:
irrigation %>%
  group_by(year) %>% 
  mutate(total_ = sum(value))
select(year, total_) %>% 
  filter(row_number(year) == TRUE )

# Difference:
irrigation_t %>%
  group_by(region) %>% 
  summarise(diff = value[year == 2007] - value[year == 1980]) %>% 
  arrange(-diff) %>% 
  slice(1:2)


