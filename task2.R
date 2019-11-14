// Задача 2, подточка а)
x = rnorm(100, 1, 2)
m = matrix(x, nrow = 100)
str(m)
c = rowSums(m)
str c
qqnorm(c)
hist(c)

x = rnorm(200, 1, 2)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98568, p-value = 0.3554

 
mean(c)
var(c)
 
x = rnorm(1000, 1, 2)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.99058, p-value = 0.7115

// Задач 2, подточка б)
x = runif(100, 0, 6)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.9404, p-value = 0.0002039

x = runif(200, 0, 6)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98044, p-value = 0.1437

 
x = runif(1000, 0, 6)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98906, p-value = 0.5889


x = runif(10000, 0, 6)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98939, p-value = 0.6156


x = runif(100000, 0, 6)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98308, p-value = 0.2293

hist(c)
hist(c, probability = T)
lines(density(c))

// Задача 2, подточка в)
x = rexp(100, 3)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.75442, p-value = 1.227e-11

 
 
x = rexp(200, 3)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)
 	Shapiro-Wilk normality test

data:  c
W = 0.85546, p-value = 1.897e-08

 
x = rexp(1000, 3)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.98422, p-value = 0.2785


x = rexp(10000, 3)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.99022, p-value = 0.6826

 
x = rexp(100000, 3)
m = matrix(x, nrow = 100)
c = rowSums(m)
qqnorm(c)
shapiro.test(c)

	Shapiro-Wilk normality test

data:  c
W = 0.99613, p-value = 0.9943
