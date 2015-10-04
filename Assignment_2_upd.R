

########################


makeCacheMatrix <- function(x = numeric()) {
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



########################################################




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




##################################################33
matv <- matrix(rnorm(5550^2), 5550)
bmat<-makeCacheMatrix(matv)


system.time(cacheSolve (bmat))

system.time(cacheSolve (bmat))



##############################3
##### Results
###############################


#> system.time(cacheInv(bbb))
#user  system elapsed 
#374.34    1.31  389.50 
#> 
#  > system.time(cacheInv(bbb))
#getting cached data
#user  system elapsed 
#0       0       0 


