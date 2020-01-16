library(raster)
# Calculate the left indexes(or above)
getLeftIndexes = function(isCycled = TRUE, size = 100){
  left = integer(size)
  if(isCycled == TRUE){
    left[1] = size
  }else{
    left[1] = 1
  }
  for (i in 2:size){
    left[i] = i - 1
  }
  return(left)
}

# Calculate the right indexes(or below)
getRightIndexes = function(isCycled = TRUE, size = 100){
  right = integer(size)
  if(isCycled == TRUE){
    right[size] = 1
  }else{
    right[size] = size
  }
  
  for (i in 1:(size-1)){
    right[i] = i + 1
  }
  return(right)
}

rotate = function(x){
  t(apply(x, 2, rev))
} 

plotResult = function(m){
  r <- raster(xmn = 0, xmx = nrow(m) - 1, ymn = 0, ymx = ncol(m) - 1, nrows = nrow(m), ncols = ncol(m))
  r[] <- m
  plot(r)
}
mod = function(n, m){
  return(n - m * floor(n/m))
}
spatialModel = function(){
  n = 40# grid size
  timeEnd = 450 # number of time steps
  dN = 0.2   # host dispersal rate
  dP = 0.8   # parasitoid dispersal rate
  lambda = 2 # 
  a = 1      # a proportionality constant
  c = 1      # number of parasitoids that hatch from an infected host
  
  Nt = matrix(0, nrow = n, ncol = n) # represent the densities of the host population at year t
  Pt = matrix(0, nrow = n, ncol = n) # represent the densities of the parasitoid population at year t
  
  Nsum = matrix(0, nrow = n, ncol = n) # auxiliary matrices for H*
  Psum = matrix(0, nrow = n, ncol = n) # auxiliary matrices for P*
  
  left = getLeftIndexes(size = n)
  right = getRightIndexes(size = n)
  
  isCycled = FALSE
  
  for (i in 1:n){
    for (j in 1:n){
      Nt[i,j] = 1
    }
  }
  # Test with random cells with parasitoids
  # randomNumbers = floor(runif(15, min=1, max=n))
  # randomNumbers2 = floor(runif(15, min=1, max=n))
  # for (number in randomNumbers) {
  #  Pt[number, randomNumbers2[mod(number, length(randomNumbers2))]] = 1
  # }
  
  # Sub-grid for parasitoids
  position = n / 2
  # Pt[position, position] = 1
  # Pt[position-1, position] = 1
  # Pt[position, position-1] = 1
  # Pt[position-1, position-1] = 1
  Pt[position, position] = 1
  
  # Random values for all cells with parasitoids
  # for (i in 1:n){
  #  for (j in 1:n){
  #    randomNumber = floor(runif(1, min=0, max=3))
  #    Pt[i, j] = randomNumber[1]
  #    
  #  }
  #}
  
  hasHostsExtinct = FALSE
  hasHostsGetLarger = FALSE
  
  for (t in 1:timeEnd){
    #plotResult(Nt)
    
    # Calculate sum of all hosts at time t. We check if it's lower than 1
    hostsSum = sum(Nt)
    
    if (hostsSum < 0.00001){
      #print("Hosts became Extinct")
      hasHostsExtinct = TRUE
    } else if (hostsSum > 1000000000) {
      hasHostsGetLarger = TRUE
    }
    
    #print(Nt)
    numberOfNeighbours = 8
    for (i in 1:n){
      for (j in 1:n){
        if(isCycled == FALSE){
          if(i == 1 && j == 1){
            Nsum[i,j] = Nt[right[i], j] + Nt[i, right[j]] + Nt[right[i], right[j]]
            Psum[i,j] = Pt[right[i], j] + Pt[i, right[j]] + Pt[right[i], right[j]]
            numberOfNeighbours = 3
          } else if(i == 1 && j == n){
            Nsum[i,j] = Nt[i, left[j]] + Nt[right[i], left[j]] + Nt[right[i], j]
            Psum[i,j] = Pt[i, left[j]] + Pt[right[i], left[j]] + Pt[right[i], j]
            numberOfNeighbours = 3
          }else if(i == 1 && j != 1){
            Nsum[i,j] = Nt[i, left[j]] + Nt[right[i], left[j]] + Nt[right[i], j] + Nt[i, right[j]] + Nt[right[i], right[j]]
            Psum[i,j] = Pt[i, left[j]] + Pt[right[i], left[j]] + Pt[right[i], j] + Pt[i, right[j]] + Pt[right[i], right[j]]
            numberOfNeighbours = 5
          }else if (i != 1 && j == 1){
            Nsum[i,j] = Nt[left[i], j] + Nt[right[i], j] + Nt[left[i], right[j]] + Nt[i, right[j]] + Nt[right[i], right[j]]
            Psum[i,j] = Pt[left[i], j] + Pt[right[i], j] + Pt[left[i], right[j]] + Pt[i, right[j]] + Pt[right[i], right[j]]
            numberOfNeighbours = 5
          }else if (i == n && j == n){
            Nsum[i,j] = Nt[left[i], left[j]] + Nt[i, left[j]] + Nt[left[i], j]
            Psum[i,j] = Pt[left[i], left[j]] + Pt[i, left[j]] + Pt[left[i], j]
            numberOfNeighbours = 3
          }else if (i == n && j == 1){
            Nsum[i,j] = Nt[left[i], j] + Nt[left[i], right[j]] + Nt[i, right[j]] 
            Psum[i,j] = Pt[left[i], j] + Pt[left[i], right[j]] + Pt[i, right[j]]
            numberOfNeighbours = 3
          }else if (i == n && j != n){
            Nsum[i,j] = Nt[left[i], left[j]] + Nt[i, left[j]] + Nt[left[i], j] + Nt[left[i], right[j]] + Nt[i, right[j]]
            Psum[i,j] = Pt[left[i], left[j]] + Pt[i, left[j]] + Pt[left[i], j] + Pt[left[i], right[j]] + Pt[i, right[j]]
            numberOfNeighbours = 5
          }else if (i != n && j == n){
            Nsum[i,j] = Nt[left[i], left[j]] + Nt[i, left[j]] + Nt[right[i], left[j]] + Nt[left[i], j] + Nt[right[i], j] 
            Psum[i,j] = Pt[left[i], left[j]] + Pt[i, left[j]] + Pt[right[i], left[j]] + Pt[left[i], j] + Pt[right[i], j]
            numberOfNeighbours = 5
          }else {
            Nsum[i,j] = Nt[left[i], left[j]] + Nt[i, left[j]] + Nt[right[i], left[j]] + Nt[left[i], j] + Nt[right[i], j] + Nt[left[i], right[j]] + Nt[i, right[j]] + Nt[right[i], right[j]]
            Psum[i,j] = Pt[left[i], left[j]] + Pt[i, left[j]] + Pt[right[i], left[j]] + Pt[left[i], j] + Pt[right[i], j] + Pt[left[i], right[j]] + Pt[i, right[j]] + Pt[right[i], right[j]]    
            numberOfNeighbours = 8
          }
        }else{
          Nsum[i,j] = Nt[left[i], left[j]] + Nt[i, left[j]] + Nt[right[i], left[j]] + Nt[left[i], j] + Nt[right[i], j] + Nt[left[i], right[j]] + Nt[i, right[j]] + Nt[right[i], right[j]]
          Psum[i,j] = Pt[left[i], left[j]] + Pt[i, left[j]] + Pt[right[i], left[j]] + Pt[left[i], j] + Pt[right[i], j] + Pt[left[i], right[j]] + Pt[i, right[j]] + Pt[right[i], right[j]]    
          numberOfNeighbours = 8
        }
      }
    }
    
    # Calculate auxilary variables H* and P*
    Nx = (1 - dN)*Nt + (dN / numberOfNeighbours) * Nsum
    Px = (1 - dP)*Pt + (dP / numberOfNeighbours) * Psum
    
    # Calculate new host and parasitoid populations
    expp = exp((-a)*Px)
    Nt = lambda * expp * Nx
    Pt = c * (1 - expp) * Nx 
    #image(rotate(Nt), col=c("black","green","red"), xaxt= "n", yaxt= "n")
   
    #image(1:ncol(x),1:nrow(x), as.matrix(t(x)), col=collist, asp=1)
    #grid(nx = n, ny = n, col = "black", lty = "solid")
    #box(which = "plot", lty = "solid")
    #readline(prompt="Press [enter] to continue")
  } 
  plotResult(Nt)
  
  if(hasHostsExtinct){
    print("Hosts became extinct")
  }else if(hasHostsGetLarger){
    print("Hosts became too large")
  }else {
    print("We found stable point of existance")
  }
}