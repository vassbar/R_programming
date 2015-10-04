
## The functions get a matrix and calculate and store its inverse. If the inverse has been
## already calculated, it is not calculated again but retrieved from the memory.

## Check at the end for an example and results.

## The first function has four sub-functions in it and gets a matrix as argument. 
## The first two sub-fuctions can
## be used to set (i.e. define) a matrix X (the set function) and to get (i.e. retrieve)  
## the matrix X. In other words the two first sub-functions are the setter and getter 
## functions in OOP terminology. The third subfunction is used to set the 
## inverse of the matrix (but it doesn't calculate it) and the
## fourth is used to retrieve the inverse of the matrix once
## it has been calculated (i.e. to get the inverse).


makeCacheMatrix <- function(x = matrix()) {

  x_inv <- NULL
  set <- function(y) {
    x <<- y
    x_inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverseM) x_inv <<- inverseM
  getInverse <- function()  x_inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
  
}


## The second function returns the inverse of matrix X. If the inverse 
## of matrix X was not calculated before, the function calculates the inverse
## first by getting the matrix X using the get sub-function from the
## makeCacheMatrix and then it uses the solve function to calculate
## the inverse. After the inverse is calculated, it stores the inverse
## as x_inv, using the setInverse sub-function from the makeCacheMatrix function.
##
## If the matrix inverse is already calculated, it doesn't calculated again,
## but it retrieves it using the getInverse from the makeCacheMatrix function,
## thus saving time.
##
## See an example after the cacheSolve function.


cacheSolve <- function(x, ...) {
  x_inv <- x$getInverse()
  if(!is.null(x_inv)) {
    message("getting cached data")
    return(x_inv)
  }
  x_matrix_to_invert <- x$get()
  x_inv <- solve(x_matrix_to_invert)
  x$setInverse(x_inv)
  x_inv
}



### EXAMPLE AND RESULTS ################

## Generate a 5550x5550 matrix with
## entries from a normal distribution
matv <- matrix(rnorm(5550^2), 5550)
## and use the makeCachematrix function
bmat<-makeCacheMatrix(matv)

## Ask the inverse for the first time, it hasn't 
## been calculated before, so it will take time to
## calculate it
system.time(cacheSolve (bmat))

## Ask the inverse for the second time, now it has been
## calculated, and it has only to be retrieved
system.time(cacheSolve (bmat))


## As seen below, tThe first it takes long to calculate the inverse
## The second time the inverse is returnes instantly.


##### RESULTS ###############

## > system.time(cacheSolve (bmat))
## user  system elapsed 
## 392.59    1.18  431.37 
## > 
##  > system.time(cacheSolve (bmat))
## getting cached data
## user  system elapsed 
##    0       0       0 








