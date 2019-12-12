data = cut(x, breaks = c(0, 0.25, 0.5, 1, 2, 3))
> t = table(data)
> tg
Error: object 'tg' not found
> t
data
  (0,0.25] (0.25,0.5]    (0.5,1]      (1,2]      (2,3] 
        45         33         25         15          1 
> pexp(0.25, 2)
[1] 0.3934693
> chisq.test(t, p = c(pexp(0.25, 2), pexp(0.5, 2), pexp(1, 2), pexp(2, 2), 1 - pexp(2,3 )))
