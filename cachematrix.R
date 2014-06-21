## Put comments here that give an overall description of what your
## functions do
## 

## Function (object) for storing matrix and corresponding
## inversed matrix

makeCacheMatrix <- function(cachedMatrix = matrix()) {
    invMatrix <- NULL
    
    # set matrix for caching
    set <- function(newMatrix) {
        cachedMatrix <<- newMatrix
        invMatrix <<- NULL
    }
    
    # get cached matrix
    get <- function() cachedMatrix
    
    # set inversed matrix
    setInv <- function(newInvMatrix) {
        invMatrix <<-newInvMatrix
    }
    #get inversed matrix
    getInv <-function() invMatrix
    
    list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## It checks that makeCacheMatrix contains inversion matrix and 
## if it contains return it. If inversion matrix is absent 
## it will be calculated and cached there

cacheSolve <- function(makeCacheMatrixEnv, ...) {
    ## Return a matrix that is the inverse of 'makeCacheMatrixEnv'
    invMatrix <- makeCacheMatrixEnv$getInv()
    
    if(!is.null(invMatrix)) {
        message("getting cached data")
        return(invMatrix)
    }
    
    cachedMatrix <- makeCacheMatrixEnv$get()
    invMatrix <- solve(cachedMatrix)
    makeCacheMatrixEnv$setInv(invMatrix)
    
    invMatrix
}