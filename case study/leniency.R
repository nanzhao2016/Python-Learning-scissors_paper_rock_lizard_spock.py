library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) #mutate %>%


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

leniency <- read.xlsx("leniency.xls", sheetName = "Sheet1")
str(leniency)

leniency <- {leniency%>%
    mutate(smile = as.factor(smile)) }


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


ggplot(leniency, aes(x = smile, y=leniency, fill=smile)) +
  geom_boxplot() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", shape=3, size=3)

leniency.grouped <- group_by(leniency, smile)
leniency.grouped.summary <- summarise(leniency.grouped, 
                                          means = mean(leniency),
                                          medians = median(leniency),
                                          sds = sd(leniency),
                                          iqrs = IQR(leniency))