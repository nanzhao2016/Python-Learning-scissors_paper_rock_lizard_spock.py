library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) #mutate %>%
require(reshape2)


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

adhd <- read.xlsx("adhd.xls", sheetName = "Sheet1")
str(adhd)


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


adhd$ID <- as.numeric(row.names(adhd))

ggplot(adhd, aes(x=ID, y=D0)) +
  geom_line() +
  geom_point()

adhd.melt <- melt(adhd, id="ID")

ggplot(adhd.melt, aes(x = ID, y=value, group=variable, colour=as.factor(variable))) +
  geom_line()+
  geom_point()+
  scale_color_discrete("medoc")

mean(adhd$D0)
sd(adhd$D0)
IQR(adhd$D0)
