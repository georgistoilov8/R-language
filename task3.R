task3 = function(){
  pMother = 0.4
  pFather = 0.3
  
  countWins = 0
  countTries = 0
  for(i in 1:n){
    wins1 = matchType1()
    wins2 = matchType2()
    prob1 = 0
    prob2 = 0
    if(wins2 >= 2){
      prob2 = pMother*pFather + (1-pMother)*pFather.pMother
    }
    if(wins1 >= 2){
      prob1 = pFather*pMother + (1-pFather)*pMother*pFather
    }
  }
}

matchType1 = function(){
  match1 = sample(0:1, 1, prob = c(1-pFather, pFather))
  match2 = sample(0:1, 1, prob = c(1-pMother, pMother))
  match3 = sample(0:1, 1, prob = c(1-pFather, pFather))
  wins = match1 + match2 + match3
  return(wins)
}

matchType2 = function(){
  match1 = sample(0:1, 1, prob = c(1-pMother, pMother))
  match2 = sample(0:1, 1, prob = c(1-pFather, pFather))
  match3 = sample(0:1, 1, prob = c(1-pMother, pMother))
  wins = match1 + match2 + match3
  return(wins)
}
