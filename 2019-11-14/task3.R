// Проверка дали данните за теглото на майките са нормални(не са)
hist(babies$wt1)
mean(babies$wt1)
[1] 153.9765
w = babies$wt1[babies$wt1 < 999]
hist(w)
shapiro.test(w)

	Shapiro-Wilk normality test

data:  w
W = 0.92842, p-value < 2.2e-16

mean(w)
[1] 128.6258
boxplot(w)
boxplot(w, horizontal = T)
qqnorm(w)
qqline(w)
