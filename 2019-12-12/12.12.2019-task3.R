H0: Текстът е на английски
Н1: Текстът не е на английски

x = scan()
1: 102 108 90 95 82 40
7: 519
8: 
Read 7 items
> sum(x)
[1] 1036
> prob = c(12.7, 9.56, 8.17, 7.51, 6.97, 6.75, 48.34)
> chisq.test(x, p = prob / 100)

	Chi-squared test for given probabilities

data:  x
X-squared = 26.396, df = 6, p-value = 0.0001878 => H1
