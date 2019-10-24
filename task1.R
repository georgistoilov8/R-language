findPeople = function(p = 1) {
  starting = 365
  for(i in 1:365) {
    p1 = findP(i)
    neededP = 1 - p1
    if(neededP > p){
      return(i)
    }
  }
  return(0)
}

findP = function(n = 1) {
  product = 1 
  for(i in 1:n){
    product = product*((365-i+1)/365)
  }
  return(product)
}
