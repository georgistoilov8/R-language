# Tasks made during computer classes in R-language for the Probabilites and Statistics course

### Basics and theory
* Commands
  * ?command - Gives detail description of the command
  * apropos("whatever") - For fast search of a function, of which we don't know the name
  * vector() - Creates a vector of numbers  
  * c(x,y,...) - Combine agruments into vector  
  * a:b - Makes sequence from a to b. If a > b then the sequence is: a, a-1, a-2, ... ,b  
  * x[ ] - Access to element at index in a vector x  
    * x[ k ] - Takes k-th element  
    * x[ -k ] - Takes all elements except k-th  
    * x[ 1: 4 ] - Takes elements from index 1 to index 4  
    * x[ c(1,3,5) ] - Takes elements with index 1, 3, 5  
    * x[ x > 0 ] - Takes all positive elements  
    * x[ x > 2 & x < 6 ] - Takes all elements which are between 2 and 6  
  * matrix() - Creates a matrix
  * str(x) - Returns the structure of the variable x
  * sort(x) - Sorts the elements in the vector x
  * order(x) - Returns the indexes of the sorted elements in the vector x
  * max(x), min(x) - Maximal/Minimal element in vector x
  * which.max(x), which.min(x) - Returns the index of the maximal/minimal element in vector x
  * install.package() - Download and install a library
  * library() - Load a library
  * attach() - Attaches library to the studio and we can access database objects by just simply giving their names
  * sum() - Returns the sum of all the values in a vector
  * table() - Creates a table
  * mean(x) - Returns "Средна аритметична стойност" of x
  * var(x) - Returns "Дисперсията" of x
  * pie(x) - Draws a pie chart based on the values of the variable x
  * boxplot(x) - Draws a bar plot chart with vertical or horizontal bars based on the values of the variable x 
