H0, H1 - хипотези
H0: мю = 24
H1: мю != 24

Решение на задача 1 по теоретичния начин
vacation
 [1] 23 12 10 34 25 16 27 18 28 13 14 20  8 21 23 33 30 13 16 14 38 19  6 11 15 21 10 39 42 25 12 17 19 26 20
> boxplot(vacation, horizontal = T)
> hist(vacation)
> qqnorm(vacation)
> qqline(vacation)
> shapiro.test(vacation)

	Shapiro-Wilk normality test

data:  vacation
W = 0.95272, p-value = 0.1374

> m = mean(vacation)
> m
[1] 20.51429
> s = sd(vacation)
> t = (m - 24) * sqrt(35) / s
> t
[1] -2.258439
> p-val = pt(t, 34)*2
Error in p - val = pt(t, 34) * 2 : object 'p' not found
> val = pt(t, 34)*2
> val
[1] 0.0304478

Ако val < 0.05 => H1,
Ако val >= 0.05 => H0

В нашия случай отхвърляме хипотезата.

Лесния начин:
t.test(vacation, mu=24, alternative = "two.sided")

	One Sample t-test

data:  vacation
t = -2.2584, df = 34, p-value = 0.03045 <------ Това гледаме
alternative hypothesis: true mean is not equal to 24
95 percent confidence interval:
 17.37768 23.65089
sample estimates:
mean of x 
 20.51429 

