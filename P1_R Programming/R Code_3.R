
? rnorm
m <- rnorm(12) # Creates a vector of 12 random numbers
m
? dim
dim(m) <- c(3,4)
m

n <- rnorm(10) # Generates a new vector of 10 random numbers
n
n<- matrix(n, nrow=5, ncol=2, byrow=T)
n
n<- matrix(n, nrow=5, ncol=2, byrow=F)
n

nrow(n)
ncol(m)
ncol(n)
nrow(m)
m <-matrix(m, nrow=3, ncol=4, byrow=F, 
           dimnames = list(c("A", "B", "C"),c("D", "E", "F","G")))
m

rownames(m) <- c("A", "B", "C")
m
colnames(m) <- c("D", "E", "F","G")
m
? matrix
m <-matrix(m, nrow=3, ncol=4, byrow=F)
m
t(m)
#using rbind() (add on rows) or cbind() (add on columns).
X1 <- matrix(1:12, nrow=3, ncol=4, byrow=T)
X1
X2 <- matrix(20:27, nrow=2, ncol=4)
X2
rbind(X1,X2,n)
rbind(X1,X2,c(1,2))

A <- matrix(1:9, nrow=3, ncol=3)
A
B <- matrix(10:18, nrow=3, ncol=3)
B
cbind(A,B)
C <- A %*% B # Calculates the product of two matrices, C = AB
C
C <- A*B # Calculates element by element products
C

crossprod(A, B) # = t(A) %*% B

diag(n) # Creates a diagonal matrix with
# the values in the vector n on
# the diagonal

solve(C) # Calculates the inverse of A

C^(-1) # Calculates 1/c_ij

eigen(C) # Calculates the eigenvalues and
# eigenvectors of C

X <- matrix(rnorm(30), nrow=5)
dimnames(X) <- list(letters[1:5], LETTERS[1:6])
X
X[3,2]
X["c", "B"]
X[,c(2,4)]#elements in columns 2 and 4
X[2:4,] #elements in rows 2 to 4

#index array
#elements X[1,3], X[2,2] and X[3,1]
index <- array(c(1:3, 3:1), dim=c(3,2))
index 
X[index]
X
X[index] <- 0
X

#array can have multiple dimensions
z <- rnorm(300)

dim(z) <- c(10, 6, 5) #Creates a 3-d array with dimensions 10*6*5 
# (like storing 5 matrices, each with 10 rows and 6 columns)
A1 <- array(0, c(2, 2, 3)) # Creates an array of zeros
a <- rnorm(50)
A2 <- array(a, c(5, 5, 2)) # Creates an array from vector a 
? array

#Elements of multi-dimensional arrays 
arr.1 <- array(1:24, dim=c(4,2,3))
arr.1[2,,] # Extracts the data in row 2 of the 3 `matrices'.
arr.1[,2,] # Extracts the data in column 2 of the 3 `matrices'.
arr.1[,,1] # Extracts the data in the first `matrix'.
arr.1[1,2,3] # Extracts the data in the row 1, column 2 of the
# third `matrix'.
