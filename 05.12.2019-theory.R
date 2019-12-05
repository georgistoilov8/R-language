[- Theory
Тестове за еднородност:
H0: muX = muY
H1: muX != muY
xN <- N(muX, sigmaX^2/n)
yM <- N(muY, sigmaY^2/m)
Тогава: xN - yM = (muX - muY, sigmaX^2/n + sigmaY^2/m)
=> t = (xN - yN)/sqrt(sX^2/n + sY^2/m) <- t(n+m-2) <= При H0.

Ръчно решение на задача:
x = rnorm(20, 0, 1)
y = rnorm(20, 1, 1)
boxplot(x, y)
mx = mean(x)
my = mean(y)
dx = var(x) 
dy = var(y)
t = (mx - my) / sqrt(dx / 20 + dy / 20 )
t
[1] -2.016799
pt(t, df = 38)
[1] 0.02541147

Ако данните са нормални -> t.test
Ако са произволни => wilcox.test
Ако са пропорции => prop.test

> t.test(x, y, var.equal = T)

	Two Sample t-test

data:  x and y
t = -2.0168, df = 38, p-value = 0.05082
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.427126421  0.002682223
sample estimates:
 mean of x  mean of y 
0.06797485 0.78019695 

> t.test(x, y, var.equal = T, alternative = "less")

	Two Sample t-test

data:  x and y
t = -2.0168, df = 38, p-value = 0.02541
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
      -Inf -0.116836
sample estimates:
 mean of x  mean of y 
0.06797485 0.78019695 

ако са сдвоени ползваме paired
-]

[- Theory
Как работи wilcox.test
1. Подрежда всички елементи по големина
2. Опитва се да оцени дали са равномерно разпределени
3. Взима тези, които са по-малко и им смята сума на ранговете.
4. t = rank xi 
-]
