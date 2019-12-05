H0: muX = muY
H1: muX != muY

> x = scan()
1: 70 85 63 54 65 80 75 95 52 55
11: 
Read 10 items
> y = scan()
1: 72 86 62 55 63 80 78 90 53 57
11: 
Read 10 items
> boxplot(x, y)
> qqnorm(x)
> qqline(x)
> qqnorm(y)
> qqline(y)
> shapiro.test(x)

	Shapiro-Wilk normality test

data:  x
W = 0.94879, p-value = 0.6543

> shapiro.test(y)

	Shapiro-Wilk normality test

data:  y
W = 0.92451, p-value = 0.3961

> t.test(x, y, paired = T, alternative = "two.sided")

	Paired t-test

data:  x and y
t = -0.26941, df = 9, p-value = 0.7937
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.879354  1.479354
sample estimates:
mean of the differences 
                   -0.2 
p-value = 0.79 => HO (т.е радарите са еднакви)
