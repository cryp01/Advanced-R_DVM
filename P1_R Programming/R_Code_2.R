x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
assign("x", c(10.4, 5.6, 3.1, 6.4, 21.7))
x
x[1]
x[5]
y <- c(x, 0, x)
y
1/x
v <- x + y
v
cos(x)
sum(x)
length(x)
sum(x)/length(x)
mean(x)
sqrt(-17)
sqrt(-17+0i)
1:10
seq(1,10)
seq(from=1, to=10)
seq(to=10, from=1)
s1 <- seq(1,10, by=0.5)
s1
s2 <- seq(1,10, length=5)
s2
s3 <- rep(x, 2)
s3
s4 <- rep(c(1,4),c(10,15))
s4
z <- c("Canberra", "Sydney", "Newcastle", "Darwin")
z <- c('Canberra', 'Sydney', 'Newcastle', 'Darwin')
c(z, "Mary", "John")
temp <- x > 13
is.na(x)
w <- c(1:10, rep(NA,4), 22)
w
is.na(w)
ex1 <- w[!is.na(w)]
ex1
ex2 <- w[1:3]
ex2
ex3 <- w[-(1:4)]
ex3
ex4 <- w[-c(1,4)]
ex4

x
x[1] <- 5
x
w[is.na(w)] <- 0
w
y <- c(-1, -2, rep(0, 3), 7, 8, 9)
y
y[y < 0] <- -y[y < 0] #same as abs(y)
y
#Factors
gender <- c(rep("female", 200), rep("male", 300))
gender <- factor(gender)
gender
levels(gender)
satisfaction <- c(1, 3, 4, 2, 2)
fsatisfaction <- factor(satisfaction, levels=1:5)
levels(fsatisfaction) <- c("very poor", "poor", "average",
                           "good", "very good")
satisfaction
fsatisfaction
