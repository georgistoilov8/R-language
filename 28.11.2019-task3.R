H0: mu = 5
H1: mu > 5

x = scan()
1: 12.8 3.5 2.9 9.4 8.7 0.7 0.2 2.8 1.9 2.8 3.1 15.8
13: 
Read 12 items
qqnorm(x)
qqline(x)
?wilcox.test
wilcox.test(x, mu = 5, alternative = "greater")

	Wilcoxon signed rank test with continuity
	correction

data:  x
V = 39, p-value = 0.5156
alternative hypothesis: true location is greater than 5

Warning message:
In wilcox.test.default(x, mu = 5, alternative = "greater") :
  cannot compute exact p-value with ties
  
p-value = 0.5156 => Не може да отхвърлим H0
