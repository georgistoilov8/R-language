x = scan() -> Ако искаме да въведем много данни чрез copy/paste и нямаме запетайки между тях. Ако имат ги пляскаме в c(...)
1: 10.0 13.6 13.2 11.6 12.5 14.2 14.9 14.5 13.4 8.6 11.5 16.0 14.2 16.8 17.9 17.0
17: 

// Проверка дали данните са нормално разпределени
hist(x)
boxplot(x, horizontal = T)
qqnorm(x)
qqline(x)
shapiro.test(x)
Shapiro-Wilk normality test

data:  x
W = 0.97917, p-value = 0.9567

// Извод: Нормални са


t.test(x)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 12.39066 15.09684
sample estimates:
mean of x 
 13.74375 
 
 t.test(x, conf.level = 0.9)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
90 percent confidence interval:
 12.63088 14.85662
sample estimates:
mean of x 
 13.74375 
