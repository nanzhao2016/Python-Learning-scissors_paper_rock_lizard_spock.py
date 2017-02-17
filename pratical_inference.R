#### Packeges ####
library(ggplot2)

set.seed(123)
setwd("C:/Users/OPEN/Documents/R_workingdirectory")



sample(2000:5000, n, replace = T)


n <- (100*200)
data <- sample(3000:5000, n, replace = T)
data <- runif(n, 2000, 5000)
class(data)

salary <- matrix(data, nrow=100, ncol=200)


sample_means <- apply(salary, 2, mean)

ggplot(data.frame(sample_means), aes(sample_means)) +
  geom_density()


ggplot(data.frame(sample_means), aes(sample_means)) +
  geom_freqpoly() 

ggplot(data.frame(sample_means), aes(sample_means)) +
  geom_histogram() 



data2 <- vector(mode="numeric", length = 0)
for (i in 1:200) {
  data2 <- c(data2, sample(3000:5000, 100, replace = T))
}
salary2 <- matrix(data2, nrow=100, ncol=200)
sample_means2 <- apply(salary2, 2, mean)

ggplot(data.frame(sample_means2), aes(sample_means2)) +
  geom_density()

ggplot(data.frame(sample_means2), aes(sample_means2)) +
  geom_freqpoly() 

ggplot(data.frame(sample_means2), aes(sample_means2)) +
  geom_histogram()
