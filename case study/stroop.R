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

#correlation

ggplot(stroop, aes(x=words, y=colors)) + 
  geom_point()

cor(stroop$words, stroop$colors)

#Range Restriction
stroop.filtered <- stroop[order(stroop$colors),][1:20,]
cor(stroop.filtered$words, stroop.filtered$colors)
