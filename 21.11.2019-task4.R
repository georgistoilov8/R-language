87 - брой хора, които са използвали продукта
150 - брой хора, които са попитани

prop.test(87, 150, conf.level = 0.92)

	1-sample proportions test with continuity correction

data:  87 out of 150, null probability 0.5
X-squared = 3.5267, df = 1, p-value = 0.06039
alternative hypothesis: true p is not equal to 0.5
92 percent confidence interval:
 0.5051991 0.6514474
sample estimates:
   p 
0.58 

prop.test(870, 1500, conf.level = 0.92)

	1-sample proportions test with continuity correction

data:  870 out of 1500, null probability 0.5
X-squared = 38.081, df = 1, p-value = 6.788e-10
alternative hypothesis: true p is not equal to 0.5
92 percent confidence interval:
 0.5572139 0.6024550
sample estimates:
   p 
0.58 
