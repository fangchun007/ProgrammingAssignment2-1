## The first function makeCacheMatrix creates a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv  <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## The second function cacheSolve calculates the inverse of the matrix
## created with the above function via $get(). However, it first checks
## to see if the inverse has already been calculated. If so, it gets 
## the inverse from the cache via $getInverse() and skips the computation.
## Otherwise, it calculates the inverse of the data by using solve function 
## and sets the value of the inverse in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
        }
        ## otherwise, calculates the inverse by solve()
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
