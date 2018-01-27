
#install.packages("bnlearn")
#install.packages("gRain")
#source("http://bioconductor.org/biocLite.R")
#biocLite("Rgraphviz")
#biocLite("RBGL")

suppressMessages(suppressWarnings(library("bnlearn")))
suppressMessages(suppressWarnings(library("gRain")))
suppressMessages(suppressWarnings(library("gRbase")))
suppressMessages(suppressWarnings(library("Rgraphviz")))
suppressMessages(suppressWarnings(library("RBGL")))


DATA <- load("C:/Users/Nonika/Desktop/DVM_Block_3/datos_generados_ejercicio_7.rdata")

data <- subset(datos_generados_ejercicio_7,!(X=="NA" | Y=="NA" | Z=="NA"))

# Now we create a empty network: 
names<-c("Z","Y","X") 
net=empty.graph(names) 
net 
class(net) 

# we see that "net" is a bn object.
# Now introduce the arrows: 

arcs(net)=  matrix(c("X","Z","Y","Z"), ncol=2, byrow=TRUE, dimnames=list(c(),c("from","to")))

data <- data.frame(lapply(data, as.factor))

colnames(data)<-c("Z","Y","X")
net.estimated=bn.fit(net,data, method="mle")
net.estimated 
class(net.estimated)  
coef<-coefficients(net.estimated)
coef

# Estimations of the parameters are: 

#X values

# theta_11=P(X=true)= 
dx<-coef$X
coef.mx<-as.matrix(dx)
coef.mx

theta_11<-coef.mx[2]

#Y values

# theta_21=P(Y=true)= 
dy<-coef$Y
coef.my<-as.matrix(dy)
coef.my

theta_21<-coef.my[2]

#Z values

dz<-coef$Z
coef.mz<-as.matrix(dz)
coef.mz

# theta_31=P(Z=1/X=1,Y=1) 
theta_31<-coef.mz[8]
# theta_32=P(Z=1|X=0,Y=1)
theta_32<-coef.mz[4]
# theta_33=P(Z=1|X=1,Y=0)
theta_33<-coef.mz[6]
# theta_34=P(Z=1|X=0,Y=0)
theta_34<-coef.mz[2]

theta.all<-cbind(theta_11,theta_21,theta_31,theta_32,theta_33,theta_34)
theta.all
dnum<-paste0(colnames(theta.all),":",as.character(theta.all),sep = "\n")

par(mfrow=c(1,1))
BNLplot<-graphviz.plot(net,main=toString(dnum)) 
BNLplot
