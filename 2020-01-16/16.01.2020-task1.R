Функция за проверка: oneway.test (Y ~ X) средното на У спрямо Х
Данните трябва да са нормално разпределени
Н0: mu1 = mu2 = mu3 
H1: има разлика

> x1 = scan()
1: 5 4 4 6 4 6 3 3 4 5
11: 
Read 10 items
> x2 = scan()
1: 3 2 4 5 3 4 3 4 2 4
11: 
Read 10 items
> x3 = scan()
1: 4 6 4 2 4 5 5 3 6 4
11: 
Read 10 items
> d = data.frame(x1,x2,x3)
> d
   x1 x2 x3
1   5  3  4
2   4  2  6
3   4  4  4
4   6  5  2
5   4  3  4
6   6  4  5
7   3  3  5
8   3  4  3
9   4  2  6
10  5  4  4
> boxplot(d)
> boxplot(x1,x2,x3)
> mean(x1)
[1] 4.4
> mean(x2)
[1] 3.4
> mean(x3)
[1] 4.3
> shapiro.test(x1)

	Shapiro-Wilk normality test

data:  x1
W = 0.89165, p-value = 0.177

> shapiro.test(x2)

	Shapiro-Wilk normality test

data:  x2
W = 0.90444, p-value = 0.2449

> shapiro.test(x3)

	Shapiro-Wilk normality test

data:  x3
W = 0.92883, p-value = 0.4365

> qqnorm(x2)
> hist(x2)
> s = stack( d )
> s
   values ind
1       5  x1
2       4  x1
3       4  x1
4       6  x1
5       4  x1
6       6  x1
7       3  x1
8       3  x1
9       4  x1
10      5  x1
11      3  x2
12      2  x2
13      4  x2
14      5  x2
15      3  x2
16      4  x2
17      3  x2
18      4  x2
19      2  x2
20      4  x2
21      4  x3
22      6  x3
23      4  x3
24      2  x3
25      4  x3
26      5  x3
27      5  x3
28      3  x3
29      6  x3
30      4  x3
> unstack(s)
   x1 x2 x3
1   5  3  4
2   4  2  6
3   4  4  4
4   6  5  2
5   4  3  4
6   6  4  5
7   3  3  5
8   3  4  3
9   4  2  6
10  5  4  4
> oneway.test( s$values ~ s$ind, var.equal = T )

	One-way analysis of means

data:  s$values and s$ind
F = 2.4894, num df = 2, denom df = 27, p-value = 0.1018

p-value-то е 10%. Голямо p-value => не можем да отхвърлим H0(по скоро са еднакви)
Ако е < 5% отхвърляме хипотезата

df = брой групи без 1
denom df = брой наблюдения без брой групи

kruskal.test(  s$values ~ s$ind )

	Kruskal-Wallis rank sum test

data:  s$values by s$ind
Kruskal-Wallis chi-squared = 4.3647, df = 2, p-value = 0.1128

Ползваме Kruskal.test, когато данните не са нормално разпределени
