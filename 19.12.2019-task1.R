H0: b1 = -1
H1: b1 != -1

> Y = 220 - X
Error: object 'X' not found
> X = scan()
1: 18 23 25 35 65 54 34 56 72 19 23 42 18 39 37
16: 
Read 15 items
> Y = 220 - X
> Y = scan()
1: 202 186 187 180 156 169 174 172 153 199 193 174 198 183 178
16: 
Read 15 items
> l = lm(y~x)
> plot(x, y)
> plot(x, y)
> plot(X, Y)
> l = lm(Y~X)
> abline(l)
> summary(l)

Call:
lm(formula = Y ~ X)

Residuals:
    Min      1Q  Median      3Q     Max 
-8.9258 -2.5383  0.3879  3.1867  6.6242 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 210.04846    2.86694   73.27  < 2e-16 ***
X            -0.79773    0.06996  -11.40 3.85e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.578 on 13 degrees of freedom
Multiple R-squared:  0.9091,	Adjusted R-squared:  0.9021 
F-statistic:   130 on 1 and 13 DF,  p-value: 3.848e-08

> s = summary(l)
> s$coefficients
               Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 210.0484584 2.86693893  73.26576 2.124074e-18
X            -0.7977266 0.06996281 -11.40215 3.847987e-08
> s$coefficients[1,1]
[1] 210.0485
> c = s$coefficients
> t = (c[2,1] - (-1))/c[2,2]
> t
[1] 2.891157
> pt(t, df = 13)
[1] 0.9936898
> 1 - pt(t, df = 13)
[1] 0.006310157
> (1 - pt(t, df = 13)) * 2
[1] 0.01262031
> p_val = (1 - pt(t, df = 13)) * 2 => Отхвърляме хипотезата, т.е Н1

H0: b0 = 220
H1: b1 != 220
И тук отхвърляме Н0

Y = 220 - X
> l = lm(Y~X)
> s = summary(l)
Warning message:
In summary.lm(l) : essentially perfect fit: summary may be unreliable
> plot(X, Y)
> c = s$coefficients
> c
            Estimate   Std. Error       t value      Pr(>|t|)
(Intercept)      220 2.599148e-14  8.464313e+15 3.300383e-201
X                 -1 6.342782e-16 -1.576595e+15 1.015999e-191
> t = (c[2,1] - (-1))/c[2,2]
> p_val = (1 - pt(t, df = 13)) * 2
> p_val
[1] 0.1848368
> 
> 
> 
> d = data.frame(X = c(30, 40, 50))
> Y = scan()
1: 202 186 187 180 156 169 174 172 153 199 193 174 198 183 178
16: 
Read 15 items
> l = lm(Y~X)
> plot(X, Y)
> predict(l, d)
       1        2        3 
186.1167 178.1394 170.1621 
> predict(l, d, interval = "confidence")
       fit      lwr      upr
1 186.1167 183.3330 188.9004
2 178.1394 175.5543 180.7245
3 170.1621 166.9706 173.3537
> predict(l, d, interval = "confidence", level = 0.9)
       fit      lwr      upr
1 186.1167 183.8348 188.3986
2 178.1394 176.0203 180.2585
3 170.1621 167.5459 172.7783
> x2 = seq(20, 70, 5)
> x2
 [1] 20 25 30 35 40 45 50 55 60 65 70
> d = data.frame(X = x2)
> p = predict(l, d, interval = "confidence", level = 0.9)
> p
        fit      lwr      upr
1  194.0939 191.0950 197.0929
2  190.1053 187.5137 192.6969
3  186.1167 183.8348 188.3986
4  182.1280 180.0149 184.2411
5  178.1394 176.0203 180.2585
6  174.1508 171.8521 176.4494
7  170.1621 167.5459 172.7783
8  166.1735 163.1448 169.2022
9  162.1849 158.6822 165.6875
10 158.1962 154.1798 162.2127
11 154.2076 149.6510 158.7642
> lines(x2, p[,2])
> lines(x2, p[,2], col = 'red')
> lines(x2, p[,3], col = 'blue')
> lines(x2, p[,1], col = 'black')
