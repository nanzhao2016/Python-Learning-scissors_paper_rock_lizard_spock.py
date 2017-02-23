library(ggplot2)
require(xlsx) # read.xlsx
require(dplyr) #mutate %>%


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

data <- read.xlsx("angry_moods.xls", sheetName = "angry_moods.txt")
str(data)


data <- {data%>%
      mutate(Gender = as.factor(Gender)) %>% 
      mutate(Sports = as.factor(Sports))}

# histogram with frequency
ggplot(data, aes(x=Anger.Out)) +
  geom_histogram(binwidth = 2)

# histogram with relatice frequency (percentage)
ggplot(data, aes(x=Anger.Out)) +
  geom_bar(aes(y=(..count..)/sum(..count..)))+
  scale_y_continuous()

mean(data$Anger.Out)
sd(data$Anger.Out)
var(data$Anger.Out)


ggplot(data, aes(x=as.character(Gender), y=Anger.Out)) +
  geom_boxplot()