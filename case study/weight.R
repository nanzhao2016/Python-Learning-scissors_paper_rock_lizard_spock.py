library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr)
set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")



weight <- read.xlsx("weight.xls", sheetName = "weight.txt")
str(weight)

weight <- {weight%>%
    mutate(WEIGHT = as.factor(WEIGHT))}


bin_Rice <- function(df, colName){
  
  numberInterval <- round(nrow(df)^(1/3)*2)
  bin_width <- round((max(df[colName]) - min(df[colName]))/numberInterval)
  return(bin_width)
}


bin_Sturge <- function(df, colName){
  numberInterval <- round(1 + log2(nrow(df)))
  bin_width <- round((max(df[colName]) - min(df[colName]))/numberInterval)
  return(bin_width)
}


ggplot(weight, aes(x = WEIGHT, y=TIME, fill=WEIGHT)) +
  geom_boxplot() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", shape=3, size=3)

ggplot(weight, aes(x=TIME))+
  geom_histogram(binwidth = 7)+
  facet_grid(.~WEIGHT)

bin_Rice(weight, "TIME")

mean(filter(weight, WEIGHT=="1")$TIME)
mean(filter(weight, WEIGHT=="2")$TIME)

mean(filter(weight, WEIGHT=="1")$TIME) - mean(filter(weight, WEIGHT=="2")$TIME)

sd(filter(weight, WEIGHT=="1")$TIME)
sd(filter(weight, WEIGHT=="2")$TIME)

sd(filter(weight, WEIGHT=="1")$TIME) - sd(filter(weight, WEIGHT=="2")$TIME)
