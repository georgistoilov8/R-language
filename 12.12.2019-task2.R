H0: Pi = 1/10  i = 0..9
H1: Pi != 1/10

attach(library(UsingR))
pi200 = pi2000[1:200]
t = table(pi200)
barplot(t)
> chisq.test(t)

	Chi-squared test for given probabilities

data:  t
X-squared = 7.2, df = 9, p-value = 0.6163 => H0
