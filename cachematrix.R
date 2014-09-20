## R programmin, assignment 2
## Caching the inverse matrix

## This functions implements cached representation of a square invertible matrix. 
## It receives a square invertable matrix as a paramater.
makeCacheMatrix <- function(x = matrix()) {
        inverse_matrix <- NULL
        set <- function(y) {
                x <<- y
                inverse_matrix <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inverse_matrix <<- inverse
        getinverse <- function() inverse_matrix
        list(
             set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse
             )
}

## This routine computes the inverse of a matrix with caching the result. It takes as a parameter 
## a cached representation of a matrix returned by makeCacheMatrix routine defined above
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
                # the inverse of a matrix has already been computed, so just read it from from the cache and return
                message("getting cached data")
                return(inverse)
        }
        # If we are computing the inverse of the matrix for the first time then:
        # get the real matrix
        data <- x$get()
        # compute inverse by calling solve() routine
        inverse <- solve(data, ...)
        # cache the inverse
        x$setinverse(inverse)
        inverse
}