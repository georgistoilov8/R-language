areNeighboursBurning = function(forest, x, y){
  if(forest[x-1,y] == 2 || forest[x+1,y] == 2 || forest[x,y-1] == 2 || forest[x,y+1] == 2){
    return(TRUE)
  }
  return(FALSE)
}

spread = function(forest, probImmune) {
  new_grid = matrix(nrow = nrow(forest), ncol = ncol(forest))
  new_grid[1,] = 0
  new_grid[,1] = 0
  new_grid[nrow(forest),] = 0
  new_grid[,ncol(forest)] = 0
  for(row in 1:nrow(forest)){
    for(col in 1:ncol(forest)){
      value = forest[row, col]
      if(value == 2){
        new_grid[row,col] = 0
      }else if(value == 1){
        if(areNeighboursBurning(forest, row, col)){
          randNumber = runif(1, 0, 1)
          if(randNumber > probImmune){
            new_grid[row, col] = 2  
          }else{
            new_grid[row, col] = 1
          }
        } else {
          new_grid[row, col] = 1
        }
      } else {
        new_grid[row, col] = 0
      }
    }
  }
  return(new_grid)
}

initForest = function(n, probTree, probBurning){
  forest = matrix(nrow = n, ncol = n)
  forest[1,] = 0
  forest[,1] = 0
  forest[n,] = 0
  forest[,n] = 0
  
  for (r in seq(2, n-1, by = 1)) {
    for (c in seq(2, n-1, by = 1)) {
      probTreeInPlace = runif(1, 0, 1)
      probTreeOnFire = runif(1, 0, 1)
      if (probTreeInPlace < probTree){
        if(probTreeOnFire < probBurning){
          forest[r,c] = 2
        } else {
          forest[r,c] = 1
        }
      }else{
        forest[r,c] = 0
      }
    }
  }
  return(forest)
}

forestFire = function(n = 10, t = 5, probTree = 0.8, probBurning = 0.2, probImmune = 0.3){
  n = 50
  probTree = 0.8
  probBurning = 0.001
  probImmune = 0.25
  t = 50
  
  
  forest = initForest(n, probTree, probBurning)
  rotate <- function(x) t(apply(x, 2, rev))
  
  for (i in (1:t)) {
    cat("Step: ", i)
    print("")
    forest = spread(forest, probImmune)
    #print(forest)
    # plot 
    image(rotate(forest), col=c("black","green","red"), zlim=c(0,2), xaxt= "n", yaxt= "n")
    grid(nx = 10, ny = 10, col = "black", lty = "solid")
    box(which = "plot", lty = "solid")
    readline(prompt="Press [enter] to continue")
  } 
}
