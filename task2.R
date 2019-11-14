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
