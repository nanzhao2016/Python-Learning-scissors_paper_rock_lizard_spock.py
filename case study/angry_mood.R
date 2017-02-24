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

means <- aggregate(Anger.Out ~ Gender, data, mean)
ggplot(data, aes(x=as.character(Gender), y=Anger.Out, fill = Gender)) +
  geom_boxplot() + 
  stat_summary(fun.y = mean, colour = "darkred", geom = "point", shape=3, size=3) +
  geom_text(data=means, aes(label=Anger.Out, y=Anger.Out+0.1))

means <- aggregate(Anger.In ~ Gender, data, mean)
ggplot(data, aes(x=as.character(Gender), y=Anger.In, fill = Gender)) +
  geom_boxplot() + 
  stat_summary(fun.y = mean, colour = "darkred", geom = "point", shape=3, size=3) +
  geom_text(data=means, aes(label=Anger.In, y=Anger.In+0.1))

means <-  aggregate(Anger.Out ~  Sports, data, mean)
ggplot(data, aes(x=as.character(Sports), y=Anger.Out, fill=Sports)) +
  geom_boxplot() +
  stat_summary(fun.y = mean, colour="darkred", geom="point", 
               shape=3, size=3)+
 geom_text(data=means, aes(y=Anger.Out +0.08, label=Anger.Out))

means <-  aggregate(Anger.In ~  Sports, data, mean)
ggplot(data, aes(x=as.character(Sports), y=Anger.In, fill=Sports)) +
  geom_boxplot() +
  stat_summary(fun.y = mean, colour="darkred", geom="point", 
               shape=3, size=3)+
  geom_text(data=means, aes(y=Anger.In +0.08, label=Anger.In))

means <- aggregate(Anger_Expression ~ Gender, data, mean)
ggplot(data, aes(x=as.character(Gender), y=Anger_Expression, fill = Gender)) +
  geom_boxplot() + 
  stat_summary(fun.y = mean, colour = "darkred", geom = "point", shape=3, size=3) +
  geom_text(data=means, aes(label=Anger_Expression, y=Anger_Expression+0.15))

means <-  aggregate(Anger_Expression ~  Sports, data, mean)
ggplot(data, aes(x=as.character(Sports), y=Anger_Expression, fill=Sports)) +
  geom_boxplot() +
  stat_summary(fun.y = mean, colour="darkred", geom="point", 
               shape=3, size=3)+
  geom_text(data=means, aes(y=Anger_Expression +0.08, label=Anger_Expression))

  

