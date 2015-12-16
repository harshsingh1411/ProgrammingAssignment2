## The functions here cache the inverse of a matrix to make computation faster

## This function creates a special "matrix" vector that caches its inverse, which is really
## a list containing 4 function to set and get the values of matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
  	set <- function(y){
  	x <<- y
  	m <<- NULL
        }
	get <- function() x
	setmatrix <- function(solve) m <<- solve
 	getmatrix <- function() m
	list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

## This function checks if inverse has been already been calculated. If it is, then it returns it from cache. 
## Otherwise it calculates the inverse and store it in the cache

cacheSolve <- function(x, ...) {
        m <- x$getmatrix()
        if(!is.null(m)){
        message("getting cached data")
        return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}
