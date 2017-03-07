library(ggplot2)
require(xlsx)
require(dplyr) 


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

stroop <- read.xlsx("stroop.xls", sheetName = "stroop.txt")
str(stroop)

stroop <- {stroop %>% mutate(gender = as.factor(gender))}

mean(stroop$words)
mean(stroop$colors)
sd(stroop$colors)
