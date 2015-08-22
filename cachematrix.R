## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	inv<-NULL 
	set<-function(y){
		x<<-y
		inv<<-NULL
	}
	
get <-function() x 

## set the inverse matrix

setinv<<-function(solve) inv<<-solve


getinv<<-function() inv

list(set=set, get=get,
	setinv=setinv,
	getinv=getinv)	
}


## This function computes the inverse of the special "matrix" returned bymakeCacheMatrix above.

cacheSolve <- function(x, ...) {
	inv<-x$getinv()
	
	
## if the inverse has already been calculated

	if(!is.null(inv)){
		message("get cached data")
		return(inv)
	}
	
## else calculate the inverse	
	
	matrix<-x$get()
	inv<-solve(matrix, ...)
	x$setinv(inv)
	return(inv)	
        ## Return a matrix that is the inverse of 'x'
}


## test it
## matrix1 <- matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
## matrix2 <- makeCacheMatrix(matrix1)
## cacheSolve(matrix2)
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
