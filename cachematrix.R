## makeCacheMatrix() creates a special "matrix" object that can cache its inverse
## this special "matrix" is really a list consisting of a function to 
## (a) set the value of the matrix based on input x
## (b) get the value of the matrix based on input x
## (c) set the value of the inverse of the matrix
## (d) get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(solve) i <<- solve
  getInv <- function() i
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

## cacheSolve() completes the inverse of the special "matrix" returned by makeCacheMatrix()
## if the inverse has already been calculated, and the matrix has not changed,
## then this function should retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
  i <- x$getInv()
  if(!is.null(i)) {
    message("getting cached inverse...")
    return(i)
  }
  newMatrix <- x$get()
  i <- solve(newMatrix, ...)
  x$setInv(i)
  i
}
