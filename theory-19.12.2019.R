Проста линейна регресия

Y = b0 + b1X + E
E - грешка
X - независима променлива (предиктор)
У - зависима променлива (отклик)
b0 - ръст на бащите
b1 - ръст на синовете

X1, X2, ... Xn
Y1, Y2, ... Yn

yi = b0+b1xi
(Ei)^2 = (yi - bo - b1xi)^2

E = sum(i)(yi - b0 - b1xi)^2

b1^ = sum()((yi - y_)(xi - x_)) / sum(i)(xi - x_)^2
x_ = sum(i)(xi) / n

bo^ = y_ - b1x_

функцията в R е lm(Y~X)

x = runif(30, 0, 10)
> y = 2*x + 1
> plot(x, y)
> cor(x, y)
[1] 1
> y = 2*x + 1 + rnorm(30)
> plot(x, y)
> lm(y ~ x)

Call:
lm(formula = y ~ x)

Coefficients:
(Intercept)            x  
      1.013        1.954  

> l = lm(y ~ x)
> abline(l)
> summary(l)

Call:
lm(formula = y ~ x)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.22946 -0.65595 -0.05019  0.25939  2.44447  -> Ei

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.01270    0.31197   3.246  0.00303 ** 
                |
                V
                b0
x            1.95418    0.05484  35.633  < 2e-16 ***
                |
                V
                b1
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9176 on 28 degrees of freedom
Multiple R-squared:  0.9784,	Adjusted R-squared:  0.9777 
F-statistic:  1270 on 1 and 28 DF,  p-value: < 2.2e-16

H1: b1 = 0 - моделът няма смисъл при тази стойност
H2: b1 != 0 - 
p-value = 10^-16 => H1

Ако имаме хипотеза: b1 = b || b1 != b, тогава можем да намерим t = (b1 - b) / SE
t <- t(n-2)
SE - стандартна грешка
