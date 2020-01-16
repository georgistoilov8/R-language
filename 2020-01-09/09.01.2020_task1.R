> setwd("C:/Users/grade/Desktop/R")
> df = read.csv('Height.txt', header = T, dec = '.', sep = '\t')
> str(df)
'data.frame':	214 obs. of  3 variables:
 $ Height   : num  66 64 64 69 66 63 68 65 64 65 ...
 $ momheight: num  66 62 65 66 63 61 64 62 70 70 ...
 $ dadheight: num  71 68 70 76 70 68 69 66 73 75 ...
 
 df = df * 2.54
 
l = lm( Height ~ . , data = df)== lm( Height ~ momheight + dadheight , data = df)
> summary(l)

Call:
lm(formula = Height ~ ., data = df)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.3980  -3.9527  -0.0944   3.7392  14.7302 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 47.11002    9.37967   5.023 1.08e-06 ***
momheight    0.30351    0.05446   5.573 7.61e-08 ***
dadheight    0.38786    0.04721   8.216 2.10e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.159 on 211 degrees of freedom
Multiple R-squared:  0.4335,	Adjusted R-squared:  0.4281 
F-statistic: 80.73 on 2 and 211 DF,  p-value: < 2.2e-16

> l2 = lm( Height ~ momheight , data = df)
> summary(l2)

Call:
lm(formula = Height ~ momheight, data = df)

Residuals:
     Min       1Q   Median       3Q      Max 
-12.5985  -3.8139   0.0172   3.8694  16.6537 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 86.41657    9.24708   9.345  < 2e-16 ***
momheight    0.48340    0.05716   8.457 4.45e-15 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.913 on 212 degrees of freedom
Multiple R-squared:  0.2523,	Adjusted R-squared:  0.2488 
F-statistic: 71.53 on 1 and 212 DF,  p-value: 4.446e-15

> l2 = lm( Height ~ momheight - 1, data = df)
> summary(l2)

Call:
lm(formula = Height ~ momheight - 1, data = df)

Residuals:
    Min      1Q  Median      3Q     Max 
-18.270  -5.224  -0.079   4.893  17.723 

Coefficients:
          Estimate Std. Error t value Pr(>|t|)    
momheight 1.017043   0.002962   343.4   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 7.01 on 213 degrees of freedom
Multiple R-squared:  0.9982,	Adjusted R-squared:  0.9982 
F-statistic: 1.179e+05 on 1 and 213 DF,  p-value: < 2.2e-16

> anova(l, l2)
Analysis of Variance Table

Model 1: Height ~ momheight + dadheight
Model 2: Height ~ momheight - 1
  Res.Df     RSS Df Sum of Sq      F    Pr(>F)    
1    211  5616.1                                  
2    213 10466.5 -2   -4850.4 91.117 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
