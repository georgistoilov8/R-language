H0: Px = Py
Н1: Px > Py
Px - непушачи
Py - пушачи
prop.test(c(351, 71), c(605, 195), alternative = "greater")

	2-sample test for equality of proportions with continuity
	correction

data:  c(351, 71) out of c(605, 195)
X-squared = 26.761, df = 1, p-value = 1.151e-07
alternative hypothesis: greater
95 percent confidence interval:
 0.1470851 1.0000000
sample estimates:
   prop 1    prop 2 
0.5801653 0.3641026

p-value е малко => Отхвърляме(т.е Н1)
