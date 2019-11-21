// Моя жалък опит
f = function(n = 100) {
     numbers = seq(1:n)
     count = 0
     for (numb in numbers) {
         x = rnorm(20, 5, 2)
         d = t.test(x, conf.level = 0.9)
         c = d$conf.int < 5
         if(any(c, na.rm = T)){
             count = count + 1
         }
     }
     return(count)
 }
 
 // Решение
 tt = function(n = 100) {
     res = matrix(0, nrow = n, ncol = 2)
     
     for(i in 1:n) {
         t = t.test(rnorm(20, 5, 2), conf.level = 0.9)
         res[i, ] = t$conf.int
     }
     return(res)
 }
 
 m = tt()
 // t(m) - транспониране на матрицата m
 matplot(t(m), rbind(1:100, 1:100), type = "l")
 abline(v = 5)
