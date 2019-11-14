Как да разберем дали данните са нормални?

x = rnorm(100)
y = runif(100, 0, 5)
z = rexp(100)
boxplot(x, horizontal = T)
boxplot(y, horizontal = T)

boxplot(z, horizontal = T)
hist(x) -> нормални данни
hist(y) -> не нормални данни
hist(z) -> не нормални данни

//Алгоритъма на qqnorm но направен ръчно 
p = seq(0.005, by = 0.01, length.out = 100)
p
q = qnorm(p)
q
plot(q, sort(x))
//

qqnorm(x) -> ако са около една права, то данните са нормални, ако не са => не са нормални
qqline(x)


//
shapiro.test(x)

	Shapiro-Wilk normality test

data:  x
W = 0.98329, p-value = 0.2378
Ако p-value е над 0.05, то приемаме, че данните са нормално разпределени
shapiro.test(y)

	Shapiro-Wilk normality test

data:  y
W = 0.93566, p-value = 0.0001058
Ако p-value е под 0.05, то приемаме, че данните не са нормално разпределени
