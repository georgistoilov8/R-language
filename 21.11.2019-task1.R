// Подточка а)
x = rnorm(20, 3, 2)
x
mean(x)
q = qnorm(0.975, 0, 1)
q
m = mean(x)
m + q*sqrt( 4 / 20 )
upper = m + q*sqrt( 4 / 20)
lower = m - q*sqrt(4 / 20)
lower

// Подточка б)
s^2 = var(x)
q = qt(0.975, df = 19)
q
s2 = var(x)
upper = m + q*sqrt( s2 / 20)
lower = m - q*sqrt( s2 / 20)
upper
[1] 4.276318
lower
[1] 2.510085


Алтернативен вариант:
 t.test(x)

	One Sample t-test

data:  x
t = 8.042, df = 19, p-value = 1.55e-07
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 2.510085 4.276318  -> Това ни трябва
sample estimates:
mean of x 
 3.393202 

t.test(x, conf.level = 0.999)

	One Sample t-test

data:  x
t = 8.042, df = 19, p-value = 1.55e-07
alternative hypothesis: true mean is not equal to 0
99.9 percent confidence interval:
 1.754664 5.031739
sample estimates:
mean of x 
 3.393202 
 
 
 x = rnorm(1000, 3, 2)
> t.test(x)

	One Sample t-test

data:  x
t = 46.648, df = 999, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 2.856421 3.107296
sample estimates:
mean of x 
 2.981859 

> t.test(x[1:20])

	One Sample t-test

data:  x[1:20]
t = 8.4325, df = 19, p-value = 7.6e-08
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 2.709227 4.498165
sample estimates:
mean of x 
 3.603696 
 
 
 
