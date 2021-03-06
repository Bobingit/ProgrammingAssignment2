## "R Programming" Coursera course; assignment 2, April 2014
##  Caches inverse of a square matrix; outputs the cashed value
##         in response to repetative calls of the same matrix
##  USAGE: is shown in the "Transcript of calls" below.
##
## makeCacheMatrix(x) creates a list of functions 
##  operating on object "x" (see "Example 1" below)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    
    setsolve <- function(solve) m <<- solve
    
    getsolve <- function() m
    
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## checks if an inverse exists for the given matrix
## and returns the cached matrix; if cached matrix is not
## calculates and returns inverse of the input matrix 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getsolve()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
##  Example 1
##  ---------
##  > class(x)
##  [1] "matrix"
##  
##  > zz <-makeCacheMatrix(x)
##  > zz
##  $set
##  function (y) 
##  {
##      x <<- y
##      m <<- NULL
##  }
##  <environment: 0x0000000016033e38>
##  
##  $get
##  function () 
##  x
##  <environment: 0x0000000016033e38>
##  
##  $setsolve
##  function (solve) 
##  m <<- solve
##  <environment: 0x0000000016033e38>
##  
##  $getsolve
##  function () 
##  m
##  <environment: 0x0000000016033e38>
##  
##  > class(zz)
##  [1] "list"

##  Transcript of calls
##  -------------------
##  > x <- matrix(c(1,2,3, 6,5,4, 7,9,8),3,3)
##  > x
##       [,1] [,2] [,3]
##  [1,]    1    6    7
##  [2,]    2    5    9
##  [3,]    3    4    8
##  > solve(x)
##             [,1]       [,2]       [,3]
##  [1,]  0.1904762 -0.9523810  0.9047619
##  [2,]  0.5238095 -0.6190476  0.2380952
##  [3,] -0.3333333  0.6666667 -0.3333333
##  
##  > setwd('ProgrammingAssignment2')
##  
##  > source('cachematrix.R')
##  
##  > zz <-makeCacheMatrix(x)
##  
##  > class(zz)
##  [1] "list"
##  
##  > cacheSolve(zz)
##             [,1]       [,2]       [,3]
##  [1,]  0.1904762 -0.9523810  0.9047619
##  [2,]  0.5238095 -0.6190476  0.2380952
##  [3,] -0.3333333  0.6666667 -0.3333333
##  > r <- cacheSolve(zz)
##  getting cached data
##  > class(r)
##  [1] "matrix"
##  > 