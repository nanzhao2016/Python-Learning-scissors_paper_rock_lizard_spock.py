library(ggplot2)
require(xlsx)
require(dplyr) 


set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory/script_statistic/case\ study")

animals <- read.xlsx("animals.xls", sheetName = "nicole.xls")
str(animals)

animals <- {animals %>% mutate(GENDER = as.factor(GENDER))}



means <- aggregate(WRONG ~ GENDER, animals, mean)
ggplot(animals, aes(x=GENDER, y=WRONG, fill=GENDER)) +
  geom_boxplot()+
  stat_summary(fun.y = mean, colour = "darkred", geom = "point", shape=3, size=3) +
  geom_text(data=means, aes(label=WRONG, y=WRONG+0.1))

means <- aggregate(NECESSAR ~ GENDER, animals, mean)
ggplot(animals, aes(x=GENDER, y=NECESSAR, fill = GENDER)) +
  geom_boxplot() +
  stat_summary(fun.y = mean, colour = "darkred", geom="point", shape=3, size=3) +
  geom_text(data=means, aes(label=NECESSAR, y=NECESSAR+0.1))

#correlation
cor(animals$WRONG, animals$NECESSAR)
ggplot(animals, aes(x = NECESSAR, y=WRONG)) +
  geom_point()

