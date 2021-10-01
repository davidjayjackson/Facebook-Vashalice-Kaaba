library(tidyverse)
library(scales)
library(dlookr)
library(stringr)
library(ggmosaic)
options(scipen=1)
rm(list=ls())

df <- df %>% filter(race !="animal")
bkctf <- table(df$race,df$bkctf)
bkctf <- as.data.frame(bkctf)

bkctf <- bkctf %>%rename(race = Var1)
bkctf <- bkctf %>%rename(purchased = Var2)



ggplot(bkctf) + geom_mosaic(aes(x=purchased))
names(bkctf)

data(titanic)

ggplot(bkctf) +
  geom_mosaic(aes(x = product(race,purchased), fill = Freq))
