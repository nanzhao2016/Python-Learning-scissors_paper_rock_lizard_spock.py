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


numbers <- c(10.77, 10.55, 10.80, 9.34, 14.37, 7.40, 8.23, 8.70, 14.62, 12.10, 8.51, 8.70, 13.30, 9.04, 10.26, 6.54, 10.86, 9.02, 8.92, 9.97, 12.66, 
  9.68, 8.08,10.03, 8.25, 10.91, 10.90, 7.40, 12.62, 10.50, 12.52, 12.42, 10.93, 8.14, 10.76, 9.61, 11.44, 6.79, 5.94, 11.08, 6.81, 11.69, 8.43)
numbers.sorted <- sort(numbers)
