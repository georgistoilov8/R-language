H0: muX = muY
H1: muX < muY
muX - лекуващи се с новото лекарство
muY - лекуващи се с пласебо

x = scan()
1: 15 10 13 7 9 8 21 9 14 8
11: 
Read 10 items
y = scan()
1: 15 14 12 8 14 10
7: 7 16 10 15 12
12: 
Read 11 items
qqnorm(x)
qqline(x)
qqnorm(y)
qqline(y)
boxplot(x, y)

> shapiro.test(x)

	Shapiro-Wilk normality test

data:  x
W = 0.86663, p-value = 0.09131

> shapiro.test(y)

	Shapiro-Wilk normality test

data:  y
W = 0.93174, p-value = 0.4287

t.test(x, y, alternative = "less")

	Welch Two Sample t-test

data:  x and y
t = -0.41894, df = 15.853, p-value = 0.3404
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
     -Inf 2.189994
sample estimates:
mean of x mean of y 
 11.40000  12.09091 
 
 Извод: Не можем да отхвърлим Н0, т.е. лекарствата са горе-долу еднакви
