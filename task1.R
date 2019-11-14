x = rt(100, df = 1)
qqnorm(x)
qqline(x)
shapiro.test(x)

  Shapiro-Wilk normality test

data:  x
W = 0.27683, p-value < 2.2e-16

y = rt(100, df = 10)
qqnorm(y)
qqline(y)
shapiro.test(y)

  Shapiro-Wilk normality test

data:  y
W = 0.98364, p-value = 0.2522

z = rt(100, df = 100)
qqnorm(z)
qqline(z)
shapiro.test(z)

  Shapiro-Wilk normality test

data:  z
W = 0.98614, p-value = 0.3822
