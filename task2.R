calculateDiceThrow = function(n = 1) {
  dicesThrow = throwDice(n)
  plot(dicesThrow, type="l")
  abline(h = 1/6)
}

throwDice = function(n = 1){
  listOfProbabilities = 1:n
  countMatches = 0
  numberOfThrows = 100
  totalNumberOfThrows = 0
  for(i in 1:n){
    diceThrows = sample(1:6,numberOfThrows,replace = T)
    totalNumberOfThrows = totalNumberOfThrows + numberOfThrows
    countMatches = countMatches + sum(diceThrows==6)
    listOfProbabilities[i] = countMatches / totalNumberOfThrows
  }
  
  return(listOfProbabilities)
}
