H0: p = 81
H1: p < 81

a = which(survey$Sex == "Male")
smokers = survey$Smoke[a]
notSmokers = sum(smokers == "Never", na.rm = T)
notSmokers
[1] 89
t = table(smokers)
t
smokers
Heavy Never Occas Regul 
    6    89    10    12 
allMales = 6 + 89 + 10 + 12
allMales = t["Heavy"]

allMales = t["Heavy"] + t["Never"] + t["Occas"] + t["Regul"]
allMales
Heavy 
  117 

prop.test(notSmokers, allMales, p=0.81, alternative = "less")

	1-sample proportions test with continuity
	correction

data:  notSmokers out of allMales, null probability 0.81
X-squared = 1.5424, df = 1, p-value = 0.1071
alternative hypothesis: true p is less than 0.81
95 percent confidence interval:
 0.0000000 0.8229968
sample estimates:
        p 
0.7606838 

p-value = 0.1071 > 0.05 => Не можем да отхвърлим Н0
