H0: Pi = 1/6 за всяко i
H1: Pi != 1/6 за всяко i

-- Сметнато ръчно
n.Pi = 150.1/6 = 25
x = scan()
1: 22 21 22 27 22 36
7: 
Read 6 items
> nPi = 25
> t = sum((x - 25)^2 / 25)
> t
[1] 6.72
> 1 - pchisq(t, df = 5)
[1] 0.2423109 -> p-value
=> H0 (нямаме основание да отхвърлим хипотезата)

-- Сметнато тарикатски
chisq.test(x)

	Chi-squared test for given probabilities

data:  x
X-squared = 6.72, df = 5, p-value = 0.2423
