H0: mu >= 100
H1: mu < 100

c = cancer$stomach
c
 [1]  124   42   25   45  412   51 1112   46  103  876
[11]  146  340  396
qqnorm(c)
qqline(c)
wilcox.test(c, mu = 100, alternative = "less")

	Wilcoxon signed rank test

data:  c
V = 61, p-value = 0.8633
alternative hypothesis: true location is less than 100

p-value = 0.8633

Ако
H0: mu <= 100
H1: mu > 100
wilcox.test(c, mu = 100, alternative = "greater")

	Wilcoxon signed rank test

data:  c
V = 61, p-value = 0.1527
alternative hypothesis: true location is greater than 100

p-value = 0.1527

Извод: Хубаво е да има повече данни, за да имаме по-добра оценка.
