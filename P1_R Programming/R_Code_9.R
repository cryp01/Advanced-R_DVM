

sf1 <- function(x){
  x^2
}

sf1(x = 3)
sf1(3)
x.sq <- sf1(x = 3) 
x.sq <- sf1(3)

sf2 <- function(a1, a2, a3){
  x <- sqrt(a1^2 + a2^2 + a3^2)
  return(x)
}
sf2(a1=2, a2=3, a3=4) # Can't see result
sf2(2, 3, 4) # Can't see result
res <- sf2(a1=2, a2=3, a3=4) # Need to use this
res <- sf2(2, 3, 4) # Need to use this
res

mypower <- function(x, pow=2){
  x^pow
}
mypower(4)
mypower(4, 3)
mypower(pow=5, x=2)

myfunc <- function(x)
{
  # x is expected to be a numeric vector
  # function returns the mean, sd, min, and max of the vector x
  the.mean <- mean(x)
  the.sd <- sd(x)
  the.min <- min(x)
  the.max <- max(x)
  return(list(average=the.mean,stand.dev=the.sd,minimum=the.min,
              maximum=the.max))
}
x <- rnorm(40)
res <- myfunc(x)
res








