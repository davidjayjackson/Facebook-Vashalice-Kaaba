
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(dlookr)
library(stringr)
options(scipen=1)
rm(list=ls())

# data <- c(40,25,19,37,39)
# chisq.test(data)

df <- readxl::read_xlsx("./LibraOfficeAudioBookDataFinal.xlsx")
df <- janitor::clean_names(df) # Use Janitor to clean col names


##
TAB <- table(df$race)
chisq.test(TAB,correct = TRUE)
race_df<- as.data.frame(TAB)

##
PT <- prop.table(TAB)
chisq.test(PT)
##
TAB1 <- table(df$race,df$bkcta)
chisq.test(TAB1,correct = TRUE)
branch_df <- as.data.frame(TAB1)
#
PT <- prop.table(TAB1)
chisq.test(PT)

##
df1 <- df %>% 
  mutate(
    Race = if_else(str_detect(race, "n/a"), NA_character_, race)
  )

A <- df %>% select(title,race,bkct_a) 
books <- head(A,50)
write.csv(books,file="books.csv",row.names = F)


table(df$bkcta)
branch2 <- df %>% select(bkcta)

### Source: https://youtu.be/7vmdHIG9NR8 
prop.test(168,195,p=0.04,alternative = "two.sided",conf.level = 0.9,correct = FALSE)
