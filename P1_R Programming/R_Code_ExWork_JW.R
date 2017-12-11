#------------------------------------------------------------------------
# Entry of data at the command line - Exercise 1 - page 45
#1
elasticband <- data.frame(stretch = c(46,54,48,50,44,42,52),
                          distance = c(148,182,173,166,109,141,166)) 
elasticband
summary(elasticband)
#2
plot(distance ~ stretch, data=elasticband, pch=16, main="distance versus stretch")
#3
? hist
#4
distance <- c(148,182,173,166,109,141,166)
hist(distance)
#5
year<-1970:1979
snow.cover<- log(c(6.5, 12.0, 14.9, 10.0, 10.7, 7.9, 21.9, 12.5, 14.5, 9.2))
Eurasia <-data.frame(year,snow.cover)
plot(snow.cover ~ year, data=Eurasia, pch=16, main="snow cover versus year")
#6
ls()
ls.str()
rm(elasticband)
#-----------------------------------------------------------------------
# Vectors and Factors - Exercise 2 - page 63 and 64
#1
x<-c(3, 4, 1, 1, 2, 1, 4, 2, 1, 1, 5, 3, 1, 1, 1, 2, 4, 5, 5, 3)
x
temp <- x == 1
temp
x
x[x == 1] <- 0
x
#2
y <- c(x[x>1])
y
#3
? seq
sq1 <- seq(1,20, by=0.2)
sq1
#4
newVec <- c(x,y)
newVec
#5
ls()
ls.str()
rm(newVec)
#6
pain <- c(0, 3, 1, 2, 1, 2)
fpain <- factor(pain, levels=0:3)
levels(fpain) <- c("no pain", "mild", "medium","severe")
pain
fpain
#-----------------------------------------------------------------------
# Matrices and Arrays - Exercise 3 - page 77 and 78
#1
A3 <-matrix(c(10,20,30,50,1,4,2,3,15,11,19,5),nrow=4, ncol=3, byrow=F)
A3
B3 <-c(2.5, 3.5, 1.75)
B3
Bm3 = matrix(B3, nrow=4, ncol=3, byrow=F)
Bm3
#2
C3<-cbind(A3,Bm3)
C3
#3
H3<-rbind(A3,Bm3)
H3
#4
dim(C3)
dim(H3)
#5
D3 <-matrix(c(1,4,3,0,-2,8), nrow=2, ncol=3, byrow=T)
D3
E3 <-matrix(c(1,9,2,17,-6,3), nrow=3, ncol=2, byrow=T)
E3
G3 <- D3 %*% E3 # Calculates the product of two matrices, G = DE
G3
#6
arr <- array(1:32, dim=c(4,4,2))
arr
#7
arr[1,3,1]
#8
arr[2,4,2]
#9
Tarr3 <- sum(arr[1,3,1],arr[2,4,2])
Tarr3         
#--------------------------------------------------------------------           
# Lists - Exercise 4 - page 82
#1
Year <-c(1980, 1988, 1996, 1998, 2000, 2002)
Year 
mean_weight <- c(71.5, 72.1, 73.7, 74.3, 75.2, 74.7)
mean_weight
Gender <-c("M", "M", "F", "F", "M", "M")
Gender
mean_height<- c(179.3, 179.9, 180.5, 180.1, 180.3, 180.4)
mean_height
#2
mylist <-list(Year, mean_weight, Gender, mean_height)
names(mylist)
names(mylist) <- c("A", "B", "C", "D")
names(mylist)
#3
mylist[["D"]]
mylist$D
mylist[[4]]
#------------------------------------------------------------------------
# Data Frames - Exercise 5 - page 89 and 90
#1
Firstname <-c("Alice", "Paul", "Jerry", "Thomas", "Marguerite", "Linda")
Lastname <- c("Ryan", "Collins", "Burke", "Dolan", "Black", "McGrath")
Age <- c(37, 34, 26, 72, 18, 24)
Gender <-c("F", "M", "M", "M", "F", "F")
Points<- c(278, 242, 312, 740, 177, 195)

club.points <- data.frame(Firstname, Lastname, Age, Gender, Points)
club.points
#2
pts <-club.points$Points
pts
mean(pts)
#3
fpoints <- club.points[club.points$Gender == "F",]
fpoints
fpts <- club.points[club.points$Gender == "F", c(5)]
fpts
mean(fpts)
#4
club.points
club.points[club.points$Firstname == "Jerry" & 
              club.points$Lastname == "Burke" & club.points$Age, c(3)] <- 28

club.points
#5
maximum_M_age <- club.points[club.points$Gender == "M" & 
                             club.points$Age, c(3)]
maximum_M_age
max(maximum_M_age)
#6
club.points
mpts_age_30 <- club.points[club.points$Points > 100 &
                             club.points$Age > 30 ,]
mpts_age_30
#-----------------------------------------------------------------
# Reading Data from Files - Exercise 6 - page 96
#1
getwd()
url <- "https://raw.githubusercontent.com/isglobal-brge/TeachingMaterials/master/Master_Modelling/data/example2.txt"
download.file(url, "example2.txt" )
#2
example.dataHW <- read.table("example2.txt",header=TRUE)
example.dataHW
names(example.dataHW)
#3
write.table(example.dataHW, "print_case1.txt", row.names=TRUE, sep=" ")
print.case <-example.dataHW[c("10","11","12","13","14","15","16", "17", "18"),]
print.case
#4
print.case1 <-example.dataHW[c("23","2","5"),]
print.case1
#column 2 only
print.case2.col2 <-example.dataHW[c("23","2","5"),c(2)]
print.case2.col2
#5
#install.packages("pastecs")
library(pastecs)
stat.desc(example.dataHW)
#-------------------------------------------------------------------------
# Simulation and Probability Distributions - Exercise 7 - page 100
#1
? seq
set.seed(10)
sp<-sample(seq(0, 2, length=200), 100, replace = F)
sp
#2
seqx <- seq(-1, 1, length=20)
sp1 <- dt(seqx, df=13)
sp1
#3
sp2<- pt(0.01,df=9)
sp2
#4
#using Question 1
? rnorm
set.seed(10)
Iqx<-rnorm(200, mean = 100, sd = 15)
Iqx
Iqx.pt80<- quantile(Iqx, c(.80))
Iqx.pt80
#5
Iqx.pt90<- quantile(Iqx, c(.90))
Iqx.pt90
#6
Prob.qx <- 1-pnorm(142,100,15)
Prob.qx
#7
set.seed(0)
JWID <-rnorm(20, mean = 0, sd = 1)
JWID
set.seed(0)
JWID1 <-rnorm(20, mean = 0, sd = 1)
JWID1
set.seed(1355326)
JWID2 <-rnorm(20, mean = 0, sd = 1)
JWID2
set.seed(1355326)
JWID3 <-rnorm(20, mean = 0, sd = 1)
JWID3
#-----------------------------------------------------------------------
# Plotting - Exercise 8 - page 128 and 129
#1
x1<-c(1:20)
x1
#2
w <- 1 + (sqrt(x1)/2)
w
#3
set.seed(0)
x1 = x1
y1 = x1 + rnorm(x1)*w
dummy<-data.frame(x1,y1)
dummy
#4
par(mfrow=c(1,1))
hist(y1)
boxplot(y1)
par(mfrow=c(2,1))
hist(y1)
boxplot(y1)
#5
par(mfrow=c(1,1))
plot(y1, x1, ylab="A", xlab="B", main="My plot")
#6
par(mfrow=c(1,1))
plot(y1, x1, ylab="A", xlab="B", main="My plot")
fm <- lm(y1 ~ x1, data=dummy)
abline(coef(fm), lty=4, col="blue")
#7
resids <- resid(fm)
par(mfrow=c(1,1))
qqnorm(resids)
qqline(resids)
#8
? airquality
airquality
coplot(airquality$Ozone ~ airquality$Solar.R | airquality$Temp)
coplot(airquality$Ozone ~ airquality$Solar.R | airquality$Wind)
#9
hist(airquality$Wind, xlab="Wind", main="Histogram of Wind", col="red")

#with hist, lines and density - Raw data
x2 <- airquality$Wind
hist(airquality$Wind, xlab="Wind", main="Histogram of Wind (Raw)", 
     col="red", probability=TRUE)
lines(density(x2),col="blue", lwd=2)

#with hist, lines and density - Normalized
x3 <- airquality$Wind
h<-hist(airquality$Wind, xlab="Wind", main="Histogram of Wind (Normalized)", col="red")
xfit<-seq(min(x3),max(x3),length=40)
yfit<-dnorm(xfit,mean=mean(x3),sd=sd(x3))
yfit <- yfit*diff(h$mids[1:2])*length(x3)
lines(xfit, yfit, col="blue", lwd=2)

#-----------------------------------------------------------------
# Looping and Functions - Exercise 9 - page 140
#1
myfunc <- function(x4)
{
  # x is expected to be a numeric vector
  # function returns number squared, the number cubed, and the square root of
  # the number of the vector x
  the.sq <- x4^2
  the.cu <- x4^3
  the.sqrt <- sqrt(x4)
  return(list(number.squared = the.sq, number.cubed = the.cu,
              number.square_root=the.sqrt))
}
x4 <- 10
res <- myfunc(x4)
res
#2
myfunc1 <- function(y4)
{
  # y4 is expected to be a numeric vector
  # function returns mean number and stand deviation number
  the.mean <- mean(y4)
  the.sd <-sd(y4)
    cat(the.mean,"= mean value\n") 
    cat(the.sd, "= standard deviation value\n")
    return(list(hist(y4,xlab="N(y) ", main="Histogram of N(y)", col="red")))
}
set.seed(0)
y4 <- rnorm(2000)
res1 <- myfunc1(y4)
#3
sum.v3<- function(a1, a2, a3){
  x5 <- c(a1 + a2 + a3)
  return(x5)
}
res <- sum.v3(a1<-c(1), a2<-c(2), a3<-c(3)) 
res
#-------------------------------------------------------------------------
# if Statement - Exercise 10 - page 155
#1a)

answer <- 0
for(j in 3:5) 
{print(answer <- j + answer) 
}

#1b)

answer <- 10
j <- 0
while(j < 5) {
  j <- j + 1
  if(j == 3)
    next
  else
    print(answer <- answer + j*answer)
}

#2a)
n = 100
ft = rep(0,n)
for (i in 1:n)
{
  ft[i] = i
}
print(sum(ft))

#2b)
ft1<-1:100
print(sum(ft1))

#3a)
x5 <- seq(0, 1, 0.05)
par(mfrow=c(1,1))
plot(x5, x5, type= "l", ylab="y", xlab="x", main="Plot x versus x")

#3b)
#Adds line to plot in blue
for(j in 3:5) { 
  y6 <- x5^j }
lines(x5, y6, type = "l", col="blue")
 


