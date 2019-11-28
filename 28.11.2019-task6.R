а) Н0: mu = 3, H1: mu != 3
б) Н0: mu = 5, H1: mu != 5

При n = 10
x = rnorm(10, 2, 2)
?t.test
а)
t.test(x, mu = 3, alternative = "two.sided")

	One Sample t-test

data:  x
t = -0.98815, df = 9, p-value = 0.3489
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
 1.075983 3.754149
sample estimates:
mean of x 
 2.415066 

б)
t.test(x, mu = 5, alternative = "two.sided")

	One Sample t-test

data:  x
t = -4.3668, df = 9, p-value = 0.001805
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 1.075983 3.754149
sample estimates:
mean of x 
 2.415066 

При n = 30
x = rnorm(30, 2, 2)
а)
t.test(x, mu = 3, alternative = "two.sided")

	One Sample t-test

data:  x
t = -1.4831, df = 29, p-value = 0.1488
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
 1.717867 3.204284
sample estimates:
mean of x 
 2.461075 

б)
t.test(x, mu = 5, alternative = "two.sided")

	One Sample t-test

data:  x
t = -6.9868, df = 29, p-value = 1.108e-07
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 1.717867 3.204284
sample estimates:
mean of x 
 2.461075 

 
При n = 100
x = rnorm(100, 2, 2)
а)
t.test(x, mu = 3, alternative = "two.sided")

	One Sample t-test

data:  x
t = -3.794, df = 99, p-value = 0.0002554
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
 1.850118 2.639854
sample estimates:
mean of x 
 2.244986 

б)
t.test(x, mu = 5, alternative = "two.sided")

	One Sample t-test

data:  x
t = -13.844, df = 99, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 1.850118 2.639854
sample estimates:
mean of x 
 2.244986 
