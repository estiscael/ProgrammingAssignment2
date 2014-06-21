## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    #function for setting
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # get metrix ...
    get <- function() x
    
    #set mean value
    setinv <- function(inv) {
        m <<-inv
    }
    #get mean value
    getinv <-function() m
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinv(m)
    m
}
