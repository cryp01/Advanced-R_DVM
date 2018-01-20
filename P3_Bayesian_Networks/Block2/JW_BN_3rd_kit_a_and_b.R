
#Delivery 3, Exercise 9 BLOCK 2: Jeremy Williams  

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


#### Model 1  KIT A



tf<-c("false","true")

# Specify the CPTs:
node.E<- cptable(~ E, values=c(8,2),levels=tf)
node.B<- cptable(~ B, values=c(1,9), levels=tf)
node.S<- cptable(~ S + E + B, values=c(1,0,1,0,99,1,3,97), levels=tf)
node.S2<- cptable(~ S2 + E + B, values=c(1,0,1,0,99,1,3,97), levels=tf)
 
plist<-compileCPT(list(node.E,node.B,node.S,node.S2))
plist
plist$E
plist$B
plist$S
plist$S2

# Create a network of name "Norman.net", for instance:

Norman.net<-grain(plist)
summary(Norman.net)

# The graph:

plot1=plot(Norman.net)
plot1

# We can compute the marginal probability

# of each variable

# These probabilities are EXACT!!

querygrain(Norman.net,nodes=c("E", "B","S", "S2"),type="marginal")

querygrain(Norman.net,nodes=c("S","S2"), type="joint")


#Question 1

Norman.net.1<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("false","false"))

Norman.net.1

predOT<-querygrain(Norman.net.1,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]

#Question 2
Norman.net.2<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("true","true"))

Norman.net.2


predOT<-querygrain(Norman.net.2,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]


#Question 3

Norman.net.3<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("true","false"))

Norman.net.3


predOT<-querygrain(Norman.net.3,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]


#### Model 2  KIT B


tf<-c("false","true")

# Specify the CPTs:
node.E<- cptable(~ E, values=c(8,2),levels=tf)
node.B<- cptable(~ B, values=c(1,9), levels=tf)
node.B1<- cptable(~ B1, values=c(1,9), levels=tf)
node.S<- cptable(~ S + E + B, values=c(1,0,1,0,99,1,3,97), levels=tf)
node.S2<- cptable(~ S2 + E + B1, values=c(1,0,1,0,99,1,3,97), levels=tf)

plist<-compileCPT(list(node.E,node.B,node.B1,node.S,node.S2))
plist
plist$E
plist$B
plist$B1
plist$S
plist$S2

# Create a network of name "Norman.net", for instance:

Norman.net<-grain(plist)
summary(Norman.net)

# The graph:

plot1=plot(Norman.net)
plot1

# We can compute the marginal probability

# of each variable

# These probabilities are EXACT!!

querygrain(Norman.net,nodes=c("E", "B","B1","S", "S2"),type="marginal")

querygrain(Norman.net,nodes=c("S","S2"), type="joint")


#Question 1

Norman.net.1<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("false","false"))

Norman.net.1

predOT<-querygrain(Norman.net.1,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]

#Question 2
Norman.net.2<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("true","true"))

Norman.net.2


predOT<-querygrain(Norman.net.2,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]


#Question 3

Norman.net.3<-setEvidence(Norman.net,nodes=c("S","S2"),states=c("true","false"))

Norman.net.3


predOT<-querygrain(Norman.net.3,nodes=c("E"), type="marginal")
predOT
predOT$E[["true"]]


#BY HAND (See PDF for Formulas)

x = (0.9*(0.03*0.03) + 0.1*1)*0.2 
x

y = 0.9*((0.03*0.03*0.2) + 0.99*0.99*0.8) + 0.1*1
y

(x/y)

1-(x/y)

#------
x1 = 0.9*(0.97*0.97) *0.2  
x1
y1 = 0.9*0.97*0.97*0.2 + 0.9*(0.01*0.01*0.8) 
y1
x1/y1

1-(x1/y1)

#------
x2 = (0.9*0.97*0.9*0.03 + 0.97*0.9*0.1)*0.2
x2

y2 = (0.9*0.97*0.9*0.03*0.2 + 0.9*0.97*0.2*0.1 
      + 0.9*0.99*0.9*0.01*0.8 + 0.9*0.01*0.8*0.1) 
y2

x2/y2

1-(x2/y2)

#-----------

x3 = 0.97*0.03*0.2  
x3

y3 = 0.97*0.03*0.2+0.01*0.99*0.8
y3

x3/y3

1-(x3/y3)
