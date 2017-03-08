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


range(data$Anger.In)
quantile(data$Anger.In)  
IQR(data$Anger.In)
mean(data$Control.Out)
mean(filter(data, Sports=="1")$Control.Out)
mean(filter(data, Sports=="2")$Control.Out)

var(filter(data, Sports=="1")$Control.In)
var(filter(data, Sports=="2")$Control.In)


#Calculate Pearson's correlation
df <- data.frame(X= c(10,10,9,6,12,8,7,9,11,10,9,9,11,10,13,10,9,15,11,9,7,11,10,10,10), 
                 Y= c(11,7,8,8,11,9,7,10,12,8,11,9,12,7,13,11,12,12,11,11,7,10,8,9,9))
library(Hmisc)
rcorr(as.matrix(df), type="pearson")
cor(df$X, df$Y)

#Pearson's correlation
cor(data$Control.In, data$Control.Out)
cor(data$Anger.Out, data$Control.Out)
