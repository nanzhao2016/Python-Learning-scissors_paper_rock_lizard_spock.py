library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) #mutate %>%
require(reshape2)


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

adhd <- read.xlsx("adhd.xls", sheetName = "Sheet1")
str(adhd)

adhd$ID <- as.numeric(row.names(adhd))

ggplot(adhd, aes(x=ID, y=D0)) +
  geom_line() +
  geom_point()

adhd.melt <- melt(adhd, id="ID")
