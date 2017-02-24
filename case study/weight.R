library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr)
set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")



weight <- read.xlsx("weight.xls", sheetName = "weight.txt")
str(weight)

weight <- {weight%>%
    mutate(WEIGHT = as.factor(WEIGHT))}


ggplot(weight, aes(x = WEIGHT, y=TIME, fill=WEIGHT)) +
  geom_boxplot() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", shape=3, size=3)

ggplot(weight, aes(x=TIME))+
  geom_histogram(binwidth = 7)+
  facet_grid(.~WEIGHT)

bin_Rice(weight, "TIME")
