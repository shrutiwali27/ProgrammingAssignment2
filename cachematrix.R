#This is regarding caching functions and lexical scoping. I am using solve() to find the inverse of a matrix and 
#cache it using a free floating variable. I am also trying to cache the input matrix so that I can retrieve it and 
#compare it to any new input matrices. 


# The makeCacheMatrix function creates a 'matrix' object that caches both the input matrix and its inverse
makeCacheMatrix = function(a = matrix()) {
  i = NULL
  set = function(b) {
    a = b
          i = NULL
      }
  get = function() a
  setinverse = function(inverse) i = inverse
  getinverse = function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

#The cacheSolve function calls functions stored in the special 'matrix' returned by makeCacheMatrix. 
#If the inverse has already been calculated and the matrix has not changed, then cacheSolve retrieves the inverse from the cache. 
#If there is new input, it calculates the inverse of the data and sets the inverse in the cache via the setinverse function.


 cacheSolve <- function(a, ...) {
  i <- a$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- a$get()
  i <- solve(data, ...)
  a$setinverse(i)
  i
}

#I tried testing on the below data
#B = matrix(c(1,2,3,4,5,6),2,2)
#B1 = makeCacheMatrix(B)
#cacheSolve(B1)

#This is the result I got
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
