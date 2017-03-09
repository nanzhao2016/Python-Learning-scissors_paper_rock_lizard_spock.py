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



numPeople <- 10
sex <- sample(c("male", "female"), numPeople, replace = T)
age <- sample(14:102, numPeople, replace = T)
income <- sample(20:150, numPeople, replace = T)
minor <- age < 18 
class(minor)
mode(minor)
minor
population <- data.frame(sex=sex, age=age, income=income, minor=minor)
View(population)
population[order(population$age), ]
population[order(population$income), ]

population[order(population$age), c(1,2)]

install.packages("combinat")
require(combinat)
permn(3)
combn(3,2)
length(permn(3))
dim(combn(3,2))[2]

perm = function(n, x) {
  return(factorial(n) / factorial(n-x))
}

comb = function(n, x) {
  return(factorial(n) / (factorial(x) * factorial(n-x)))
}

perm(3, 2)
comb(3, 2)

binom = function (n, x, p) {
  return(comb(n, x) * p**x * (1-p)**(n-x))
}

binomCumu = function(n,x,p) {
  prob = 0
  for(i in 0: (x-1)){
    prob = prob + binom(n, i, p)
  }
  return(1-prob)
}

1-binomCumu(20, 4, 0.3)

poiss = function(µ, x) {
  
  return(exp(-µ)*µ**(x)/factorial(x))
}

poiss(8,11)
poiss(21, 12)
