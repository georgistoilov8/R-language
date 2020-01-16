 data = read.csv("C:/Users/grade/Desktop/New folder/data.csv")
> x = data$X18
> y = data$X24[data$X24 != -999]
> y
 [1] 27 27 25 31 35 24 19 28 23 27 20 22 18 20 31 32 31 32 24 26 29 24 24 33 33 32 28 19 32 34 26 30 22 22 33 39 36 28 27 21 24 30 34 32 38 37 30 31 37 32 47
[52] 41 45 34 33 24 32 39 35 32 37 38 34 34 32 33 32 25 24 37 31 36 36 34 38 32 38 32
> x
  [1] 15 18 16 17 15 14 14 14 15 15 14 15 14 22 18 21 21 10 10 11  9 28 25 19 16 17 19 18 14 14 14 14 12 13 13 18 22 19 18 23 26 25 20 21 13 14 15 14 17 11 13
 [52] 12 13 15 13 13 14 22 28 13 14 13 14 15 12 13 13 14 13 12 13 18 16 18 18 23 11 12 13 12 18 21 19 21 15 16 15 11 20 21 19 15 26 25 16 16 18 16 13 14 14 14
[103] 28 19 18 15 15 16 15 16 14 17 16 15 18 21 20 13 23 20 23 18 19 25 26 18 16 16 15 22 22 24 23 29 25 20 18 19 18 27 13 17 13 13 13 30 26 18 17 16 15 18 21
[154] 19 19 16 16 16 16 25 26 31 34 36 20 19 20 19 21 20 25 21 19 21 21 19 18 19 18 18 18 30 31 23 24 22 20 22 20 21 17 18 17 18 17 16 19 19 36 27 23 24 34 35
[205] 28 29 27 34 32 28 26 24 19 28 24 27 27 26 24 30 39 35 34 30 22 27 20 18 28 27 34 31 29 27 24 23 38 36 25 38 26 22 36 27 27 32 28 31
> qqnorm(x)
> qqline(x)
> qqnorm(y)
> qqline()y
Error: unexpected symbol in "qqline()y"
> qqline(y)
> shapiro.test(x)

	Shapiro-Wilk normality test

data:  x
W = 0.93797, p-value = 9.96e-09

> shapiro.test(y)

	Shapiro-Wilk normality test

data:  y
W = 0.97693, p-value = 0.1685

> wilcox.test(x, y, alternative = "two.sided")

	Wilcoxon rank sum test with continuity correction

data:  x and y
W = 2456.5, p-value < 2.2e-16
alternative hypothesis: true location shift is not equal to 0

> t.test(x, y, alternative = "two.sided")

	Welch Two Sample t-test

data:  x and y
t = -12.974, df = 134.97, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -11.997851  -8.823902
sample estimates:
mean of x mean of y 
 20.15323  30.56410 

Извод: Отхвърляме хипотезата
