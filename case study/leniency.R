library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) #mutate %>%


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

leniency <- read.xlsx("leniency.xls", sheetName = "Sheet1")
str(leniency)

leniency <- {leniency%>%
    mutate(smile = as.factor(smile)) }


ggplot(leniency, aes(x = smile, y=leniency, fill=smile)) +
  geom_boxplot() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", shape=3, size=3)