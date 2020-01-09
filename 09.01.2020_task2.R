> Height = scan()
1: 100 200 300 450 600 800 1000
8: 
Read 7 items
> Distance = scan()
1: 253 337 395 451 495 534 574
8: 
Read 7 items
> l = lm(Distance ~ Height)
> plot(Height)
> plot(Height, Distance)
> summary(l)

Call:
lm(formula = Distance ~ Height)

Residuals:
       1        2        3        4        5        6        7 
-49.8788   0.7086  25.2959  31.1769  25.0578  -2.7675 -29.5929 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 269.46607   24.18421  11.142 0.000102 ***     => 0.000102 е p-value-то b0 да е равно на 0
Height        0.33413    0.04181   7.992 0.000495 ***     => 0.000495 е p-value-то b1 да е равно на 0
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 33.5 on 5 degrees of freedom
Multiple R-squared:  0.9274,	Adjusted R-squared:  0.9129 
F-statistic: 63.88 on 1 and 5 DF,  p-value: 0.0004951

Ако някое от b-тата може да е равно на нула => моделът не е хубяв

> abline(l)
> plot(l)

> l2 = lm(Distance ~ Height + I(Height^2))
> summary(l2)

Call:
lm(formula = Distance ~ Height + I(Height^2))

Residuals:
      1       2       3       4       5       6       7 
-14.420   9.192  13.624   2.060  -6.158 -12.912   8.614 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2.002e+02  1.695e+01  11.811 0.000294 ***
Height       7.062e-01  7.568e-02   9.332 0.000734 ***
I(Height^2) -3.410e-04  6.754e-05  -5.049 0.007237 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 13.79 on 4 degrees of freedom
Multiple R-squared:  0.9902,	Adjusted R-squared:  0.9852 
F-statistic: 201.1 on 2 and 4 DF,  p-value: 9.696e-05

> Height
[1]  100  200  300  450  600  800 1000
> DistanceP = predict(l2)
> lines(Height, DistanceP, col = 'red')
> plot(Height, Distance)
> abline(l)
> lines(Height, DistanceP, col = 'red')

I - избягва комбинации

anova(l, l2)
Analysis of Variance Table

Model 1: Distance ~ Height
Model 2: Distance ~ Height + I(Height^2)
  Res.Df    RSS Df Sum of Sq     F   Pr(>F)   
1      5 5611.6                               
2      4  761.2  1    4850.4 25.49 0.007237 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
=> Има разлика между двата модела
