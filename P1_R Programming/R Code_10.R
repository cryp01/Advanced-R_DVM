
#if... else

comparisons1 <- function(number)
{
  # if ... else
  if (number != 1)
  {
    cat(number,"is not one\n")
  }
  else
  {
    cat(number,"is one\n")
  }
}
comparisons1(1)  
comparisons1(20)

#if ... else if ... else
comparisons2 <- function(number)
{
  if (number == 0)
  {
    cat(number,"equals 0\n")
  }
  else if (number > 0)
  {
    cat(number,"is positive\n")
  }
  else
  {
    cat(number,"is negative\n")
  }
}
comparisons2(0) 
comparisons2(-15) 
comparisons2(1)

#both conditions must be met before a value of TRUE
comparisons3 <- function(number)
{
  if ( (number > 0) && (number < 10) )
  {
    cat(number,"is between 0 and 10\n")
  }
}
comparisons3(-1)
comparisons3(9)
comparisons3(10)

#A vectorised version of the if statement is ifelse 
x <- rnorm(20, mean=15, sd=5)
x

ifelse(x >= 17, sqrt(x), NA)

#Repetitive execution: for loops, while loops and repeat loops
#for(variable_name in sequence) {
#command
#command
#command
#}

for(i in 1:5){
  print(sqrt(i))
}

n <- 20
p <- 5
value <- vector(mode="numeric", length=n)
rand.nums <- matrix(rnorm(n*p), nrow=n)
for(i in 1:length(value)){
  value[i] <- max(rand.nums[i,])
  print(sum(value))
}

#nested for loops
# for(variable_name1 in sequence) {
 # command
  # command
  # for(variable_name2 in sequence) {
   # command
    # command
    # command
 # } # ends inner for loop
#} # ends outer for loop

#Load the function simple.nesting from Loops.R
#simple.nesting(num.fam=5, num.child=3)

#while loops
#while (condition){
#command
#command
#}

niter <- 0
num <- sample(1:100, 1)
while(num != 20) {
  num <- sample(1:100, 1)
  niter <- niter + 1
}
niter

#apply, lapply, sapply

#
rmatrix <- matrix(rexp(200, rate=.1), ncol=20)
dim(rmatrix)

#To get the mean of each row we can do:
apply(rmatrix, 1, mean)

#And to get the mean of each column:
apply(rmatrix, 2, mean)

#lapply applies a function to each element of a list
lapply(c(1,2,3), function(x){ return(x*2) })

#The same works for sapply, but returning a vector:
sapply(c(1,2,3), function(x){ return(x*2) })

?demo(plotmath)

demo(plotmath) # prints all of the mathematical symbols (and more) in r via plot

? plot

