12:09:19 Четвъртък, Ноември 21, 2019, седмица 47: Не правих нищо

attach(library(UsingR))
rat

boxplot(rat)
hist(rat)
qqnorm(rat)
qqline(rat) 
shapiro.test(rat)

	Shapiro-Wilk normality test

data:  rat
W = 0.96134, p-value = 0.571

t.test(rat, conf.level = 0.96)

	One Sample t-test

data:  rat
t = 14.176, df = 19, p-value = 1.48e-11
alternative hypothesis: true mean is not equal to 0
96 percent confidence interval:
  95.80624 131.09376
sample estimates:
mean of x 
   113.45 
   
boxplot(malpract)
hist(malpract)
qqnorm(malpract)
qqline(malpract)
shapiro.test(malpract)

	Shapiro-Wilk normality test

data:  malpract
W = 0.80547, p-value = 0.002414

t.test(malpract, conf.level = 0.96)

	One Sample t-test

data:  malpract
t = 4.009, df = 16, p-value = 0.001013
alternative hypothesis: true mean is not equal to 0
96 percent confidence interval:
  404.9367 1425.6515
sample estimates:
mean of x 
 915.2941 
 
// Алтернативен вариант за данни, които не са нормирани 
wilcox.test(malpract, conf.int = T, conf.level = 0.96)

	Wilcoxon signed rank test

data:  malpract
V = 153, p-value = 1.526e-05
alternative hypothesis: true location is not equal to 0
96 percent confidence interval:
  315 1525
sample estimates:
(pseudo)median 
           800  
 

// Взимане на данни от t.test
d = t.test(rat)
d$conf.int


// Ако дадени данни не са нормално разпределени, то можем да ги направим такива. Ще ги наричаме лог нормални.
y = log(malpract)
boxplot(y)
qqnorm(y)
qqline(y)
hist(y)
shapiro.test(y)

	Shapiro-Wilk normality test

data:  y
W = 0.95209, p-value = 0.4904

// Не добра практика
d = t.test(y, conf.level = 0.96)
exp(d$conf.int)
[1] 297.8183 977.5063
attr(,"conf.level")
[1] 0.96 
