library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) 


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

flatus <-  read.xlsx("flatulence.xls", sheetName = "Sheet1")
str(flatus)

flatus <- {flatus %>% mutate(Gender = as.factor(Gender)) %>%
                      mutate(famaccp = as.factor(famaccp)) %>%
                      mutate(mtgwork = as.factor(mtgwork)) %>%
                      mutate(talkprof = as.factor(talkprof)) %>%
                      mutate(romint = as.factor(romint))
}


bin_Rice <- function(df, colName){
  
  numberInterval <- round(nrow(df)^(1/3)*2)
  bin_width <- round((max(df[colName]) - min(df[colName]))/numberInterval)
  return(bin_width)
}

bin_Rice(flatus, "perday")

bin_Sturge <- function(df, colName){
  numberInterval <- round(1 + log2(nrow(df)))
  bin_width <- round((max(df[colName]) - min(df[colName]))/numberInterval)
  return(bin_width)
}

bin_Sturge(flatus, "perday")

ggplot(flatus, aes(x=perday)) +
  geom_histogram(binwidth = bin_Rice(flatus, "perday"))

ggplot(flatus, aes(x = Gender, y = howlong, fill=Gender)) +
  geom_boxplot() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", shape=3, size=3)

mean(flatus$perday)
median(flatus$perday)
