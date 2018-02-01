####
# source the script containing the makeCacheMatrix() and cacheSolve() functions
source('cachematrix.R')

####
# define an invertible matrix x
x <- matrix(c(2,5,2,3), ncol = 2, nrow = 2)

# calculate the special "matrix"
cacheMatrix <- makeCacheMatrix(x)

# calculate the inverse of the special "matrix", checking first to see if the mean has already been calculated
inverseMatrix <- cacheSolve(cacheMatrix)

####
# define a much larger invertible matrix x
x <- matrix(sample(c(1:10000)), nrow = 100, ncol = 100)

# calculate the special "matrix"
cacheMatrix <- makeCacheMatrix(x)

# calculate the inverse of the special "matrix", checking first to see if the mean has already been calculated
inverseMatrix <- cacheSolve(cacheMatrix)
