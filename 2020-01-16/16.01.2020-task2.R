boxplot(InsectSprays$count ~ InsectSprays$spray)
> attach(InsectSprays)
> boxplot(count, spray)
> boxplot(count ~ spray)
> hist(count[spray == 'D'])
> shapiro.test(count[spray == 'D'])

	Shapiro-Wilk normality test

data:  count[spray == "D"]
W = 0.75063, p-value = 0.002713

> kruskal.test(count ~ spray)

	Kruskal-Wallis rank sum test

data:  count by spray
Kruskal-Wallis chi-squared = 54.691, df = 5, p-value = 1.511e-10

Хипотезата е: Действат ли еднакво всички инсектициди
P-value е много малко => отхвърляме хипотезата => Не действат еднакво

Втора хипотеза: Еднакво ли действат инсектициди C, D и E
> boxplot(InsectSprays$count ~ InsectSprays$spray)
> attach(InsectSprays)
> boxplot(count, spray)
> boxplot(count ~ spray)
> hist(count[spray == 'D'])
> shapiro.test(count[spray == 'D'])

	Shapiro-Wilk normality test

data:  count[spray == "D"]
W = 0.75063, p-value = 0.002713

> kruskal.test(count ~ spray)

	Kruskal-Wallis rank sum test

data:  count by spray
Kruskal-Wallis chi-squared = 54.691, df = 5, p-value = 1.511e-10

> us = unstack(InsectSprays)
> us
    A  B C  D E  F
1  10 11 0  3 3 11
2   7 17 1  5 5  9
3  20 21 7 12 3 15
4  14 11 2  6 5 22
5  14 16 3  4 3 15
6  12 14 1  3 6 16
7  10 17 2  5 1 13
8  23 17 1  5 1 10
9  17 19 3  5 3 26
10 20 21 0  5 2 26
11 14  7 1  2 6 24
12 13 13 4  4 4 13
> d = data.frame(us$C, us$D, us$E)
> d
   us.C us.D us.E
1     0    3    3
2     1    5    5
3     7   12    3
4     2    6    5
5     3    4    3
6     1    3    6
7     2    5    1
8     1    5    1
9     3    5    3
10    0    5    2
11    1    2    6
12    4    4    4
> s = stack(d)
> d
   us.C us.D us.E
1     0    3    3
2     1    5    5
3     7   12    3
4     2    6    5
5     3    4    3
6     1    3    6
7     2    5    1
8     1    5    1
9     3    5    3
10    0    5    2
11    1    2    6
12    4    4    4
> s
   values  ind
1       0 us.C
2       1 us.C
3       7 us.C
4       2 us.C
5       3 us.C
6       1 us.C
7       2 us.C
8       1 us.C
9       3 us.C
10      0 us.C
11      1 us.C
12      4 us.C
13      3 us.D
14      5 us.D
15     12 us.D
16      6 us.D
17      4 us.D
18      3 us.D
19      5 us.D
20      5 us.D
21      5 us.D
22      5 us.D
23      2 us.D
24      4 us.D
25      3 us.E
26      5 us.E
27      3 us.E
28      5 us.E
29      3 us.E
30      6 us.E
31      1 us.E
32      1 us.E
33      3 us.E
34      2 us.E
35      6 us.E
36      4 us.E
> kruskal.test(s$values ~ s$ind)

	Kruskal-Wallis rank sum test

data:  s$values by s$ind
Kruskal-Wallis chi-squared = 10.103, df = 2, p-value = 0.0064

> 
> oneway.test(s$values ~ s$ind, var.equal = T)

	One-way analysis of means

data:  s$values and s$ind
F = 5.4873, num df = 2, denom df = 33, p-value = 0.008763

> u = unstack(InsectSprays)
> u
    A  B C  D E  F
1  10 11 0  3 3 11
2   7 17 1  5 5  9
3  20 21 7 12 3 15
4  14 11 2  6 5 22
5  14 16 3  4 3 15
6  12 14 1  3 6 16
7  10 17 2  5 1 13
8  23 17 1  5 1 10
9  17 19 3  5 3 26
10 20 21 0  5 2 26
11 14  7 1  2 6 24
12 13 13 4  4 4 13
> d = data.frame( C, D, E )
Error in data.frame(C, D, E) : object 'E' not found
> d = data.frame( u$C, u$D, u$E )
> d
   u.C u.D u.E
1    0   3   3
2    1   5   5
3    7  12   3
4    2   6   5
5    3   4   3
6    1   3   6
7    2   5   1
8    1   5   1
9    3   5   3
10   0   5   2
11   1   2   6
12   4   4   4
> s = stack(d)
> s
   values ind
1       0 u.C
2       1 u.C
3       7 u.C
4       2 u.C
5       3 u.C
6       1 u.C
7       2 u.C
8       1 u.C
9       3 u.C
10      0 u.C
11      1 u.C
12      4 u.C
13      3 u.D
14      5 u.D
15     12 u.D
16      6 u.D
17      4 u.D
18      3 u.D
19      5 u.D
20      5 u.D
21      5 u.D
22      5 u.D
23      2 u.D
24      4 u.D
25      3 u.E
26      5 u.E
27      3 u.E
28      5 u.E
29      3 u.E
30      6 u.E
31      1 u.E
32      1 u.E
33      3 u.E
34      2 u.E
35      6 u.E
36      4 u.E
> x = InsectSprays$count[InsectSprays$spray == "C" | InsectSprays$spray == "D" | InsectSprays$spray == "E"]
> x = InsectSprays[InsectSprays$spray == "C" | InsectSprays$spray == "D" | InsectSprays$spray == "E",]
> x
   count spray
25     0     C
26     1     C
27     7     C
28     2     C
29     3     C
30     1     C
31     2     C
32     1     C
33     3     C
34     0     C
35     1     C
36     4     C
37     3     D
38     5     D
39    12     D
40     6     D
41     4     D
42     3     D
43     5     D
44     5     D
45     5     D
46     5     D
47     2     D
48     4     D
49     3     E
50     5     E
51     3     E
52     5     E
53     3     E
54     6     E
55     1     E
56     1     E
57     3     E
58     2     E
59     6     E
60     4     E
> kruskal.test( x$count ~ x$spray )

	Kruskal-Wallis rank sum test

data:  x$count by x$spray
Kruskal-Wallis chi-squared = 10.103, df = 2, p-value = 0.0064

> boxplot(x$count ~ x$spray)

p-value-то е много малко => Отхвърляме хипотезата
