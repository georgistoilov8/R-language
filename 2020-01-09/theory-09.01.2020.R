Линейни модели
Многомерна линейна регресия
y = b0 + b1x1 + b2x2 + ... + bpxp + epsilon

y1, x11, x21, ... , xp1
y2, x21, x22, ... , xp2
.
.
.
yp, xp1, xp2, ... , xpp

n на брой данни и търсим b-тата

> x1 = 1 : 20
> x2 = runif(20, 0, 3)
> x3 = rnorm(20, 5)
> x4 = rnorm(20, 3)
> y = x1 + 2*x2 + x3 + 2 + rnorm(20)
> d = data.frame(y, x1, x2, x3, x4)
> str(d)
'data.frame':	20 obs. of  5 variables:
 $ y : num  6.29 11.1 15.53 13.98 16.64 ...
 $ x1: int  1 2 3 4 5 6 7 8 9 10 ...
 $ x2: num  0.661 1.753 1.433 0.97 2.681 ...
 $ x3: num  4.52 4.06 5.34 5.5 3.52 ...
 $ x4: num  3.45 2.61 3.3 2.86 3.17 ...
> plot(d)
> l = lm(y ~ x1 + x2 + x3 + x4)
> summary(l)

Call:
lm(formula = y ~ x1 + x2 + x3 + x4)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.9296 -0.6094  0.0512  0.7096  1.9765 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.09038    3.07238  -0.355   0.7276    
x1           1.00130    0.05262  19.031 6.47e-12 ***
x2           2.07324    0.35017   5.921 2.81e-05 ***
x3           1.05250    0.45150   2.331   0.0341 *  
x4           0.92295    0.53546   1.724   0.1053    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.289 on 15 degrees of freedom
Multiple R-squared:  0.9663,	Adjusted R-squared:  0.9573 
F-statistic: 107.5 on 4 and 15 DF,  p-value: 7.491e-11

Estimate: коефициентите пред съответните х-ове
После гледаме последната колонка за p-value
Ако е много малко p-value-то, то значи y зависи от съответния х.
За да махнем тези х-ове от които не зависи у, може да махнем най-голямато и пак правим опит. Това е така, защото може да има зависимост между х-овете

> l2 = lm(y ~ x1 + x2 + x3)
> summary(l2)

Call:
lm(formula = y ~ x1 + x2 + x3)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.5285 -0.7141  0.0779  0.7353  2.3819 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2.30790    2.49728   0.924   0.3691    
x1           0.97919    0.05408  18.107 4.41e-12 ***
x2           2.09273    0.37092   5.642 3.68e-05 ***
x3           0.91815    0.47132   1.948   0.0692 .  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.366 on 16 degrees of freedom
Multiple R-squared:  0.9596,	Adjusted R-squared:  0.952 
F-statistic: 126.7 on 3 and 16 DF,  p-value: 2.32e-11

Колкото по-голямо е R-squared, толкова по-добър модел имаме

Сравнение на два модела: Проверяваме хипотеза дали модела l съвпада с l2
H1: различни са
Функцията е anova
anova(l, l2)
Analysis of Variance Table

Model 1: y ~ x1 + x2 + x3 + x4
Model 2: y ~ x1 + x2 + x3
  Res.Df    RSS Df Sum of Sq      F Pr(>F)
1     15 24.931                           
2     16 29.869 -1   -4.9379 2.9709 0.9562
p-value  е голямо => приемаме хипотезата

> l3 = lm(y ~ x1 + x2)
> summary(l3)

Call:
lm(formula = y ~ x1 + x2)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.9032 -0.9068  0.1711  1.0301  2.8706 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  6.90771    0.87729   7.874 4.53e-07 ***
x1           0.96030    0.05741  16.727 5.43e-12 ***
x2           2.00363    0.39720   5.044 9.99e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.474 on 17 degrees of freedom
Multiple R-squared:   0.95,	Adjusted R-squared:  0.9442 
F-statistic: 161.6 on 2 and 17 DF,  p-value: 8.685e-12

> anova(l2, l3)
Analysis of Variance Table

Model 1: y ~ x1 + x2 + x3
Model 2: y ~ x1 + x2
  Res.Df    RSS Df Sum of Sq      F  Pr(>F)  
1     16 29.869                              
2     17 36.953 -1   -7.0843 3.7949 0.06917 .
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

И модела с две променливи става, тъй като p-value е > 5%

> l4 = lm(y~x1)
> summary(l4)

Call:
lm(formula = y ~ x1)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.3710 -1.4157 -0.4207  1.5485  3.7102 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   9.6733     1.0517   9.198 3.18e-08 ***
x1            0.9866     0.0878  11.237 1.44e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.264 on 18 degrees of freedom
Multiple R-squared:  0.8752,	Adjusted R-squared:  0.8683 
F-statistic: 126.3 on 1 and 18 DF,  p-value: 1.441e-09

> anova(l3, l4)
Analysis of Variance Table

Model 1: y ~ x1 + x2
Model 2: y ~ x1
  Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1     17 36.953                                  
2     18 92.266 -1   -55.313 25.446 9.986e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
p-value е много малко => l4 е различно от l3
