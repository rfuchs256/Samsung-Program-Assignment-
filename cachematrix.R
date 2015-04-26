## The makeCacheMatrix function is a list of functions that 
## 1. set the value of the vector
## 2. get the value of the vector
## 3. sets the value of the inverse of the matrix
## 4. gets the value of the inverse of the matrix

## The cacheSolve function calculates the inverse of the matrix
## if it does not exist.  If it exists it will get it value.
 
## This function creates a special vector that can cache the inverse
## of a matrix

makeCacheMatrix <- function(x = matrix()) { 
           m<-NULL
           y<-NULL
           set<-function(y){
                   x<<-y
                   m<<-NULL
           }
           get<-function() x
           setinv<-function(inverse) m<<-inverse
           getinv<-function() m
           list(set=set,get=get,setinv=setinv,getinv=getinv)
                   
                   
} 

## This function will solve the inverse of a matrix

 
cacheSolve <- function(x=matrix(), ...) { 
         ## Return a matrix that is the inverse of 'x' 
        m<-x$getinv()
        ## Test to see if matrix exists and equals the set matrix if so get it and return
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        ## Otherwise get the matrix and calculate the inverse
        data<-x$get()
        m<-solve(data, ...)
        x$setinv(m)
        m
} 
