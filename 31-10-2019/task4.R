task 2
dbinom(2, 7 , 0.2) * 0.2 2.a)

pbinom(2, 6, 0.2) 2.b)

2. c)
sum(dbinom(2, 4:7, 0.2)) * 0.2
Или
(dbinom(2, 4, 0.2) + dbinom(2, 5, 0.2) + dbinom(2, 6, 0.2) + dbinom(2, 7, 0.2))*0.2


task 3:
 a = rhyper(1000, 7, 6, 8)
 mean(a)
 var(a)
 barplot(table(a))
 hist(a)
 hist(a, breaks = 1:8
 hist(a, breaks = 1:8, probability = T) - Емперично разпределение
 dhyper(2:7, 7, 6, 8)
 sum(dhyper(2:7, 7, 6, 8))
 lines(c(1,2,2,3,3,4,4,5,5,6), x)
  x = c(1,2,2,3,3,4,4,5,5,6,6,7) => Правим и y да е със стойности от hyper и ги match-ваме
