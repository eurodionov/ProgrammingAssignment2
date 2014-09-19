## R programmin, assignment 2
## Testing cachematrix.R

source("cachematrix.R")

## iterate over matrices of different size
for (m_size in 2:40) {
        # generate random matrix
        m <- matrix(rnorm(m_size * m_size), m_size, m_size)
        m_cached <- makeCacheMatrix(m)
        
        message("iverting matrix: attempt 1")
        cacheSolve(m_cached)
        message("iverting matrix: attempt 2")
        cacheSolve(m_cached)
}

