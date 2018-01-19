

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
node.E<-cptable(~ E, values=c(2,8),levels=tf)
node.B<-cptable(~ B , values=c(9,1), levels=tf)
node.S<-cptable(~ S + E , values=c(9.9,0.1,0.3,9.7), levels=tf)
node.L<-cptable(~ S + B, values=c(1,0,0.72,0.28), levels=tf)
node.S2<-cptable(~ S2 + E , values=c(9.9,0.1,0.3,9.7), levels=tf)
node.L2<-cptable(~ S2 + B, values=c(1,0,0.72,0.28), levels=tf)

plist<-compileCPT(list(node.E,node.B,node.S,node.L,node.S2,node.L2))
plist
plist$E
plist$B
plist$S
plist$L
plist$S2
plist$L2

# Create a network of name "Norman.net", for instance:

Norman.net<-grain(plist)
summary(Norman.net)

# The graph:

plot1=plot(Norman.net)
plot1

# We can compute the marginal probability

# of each variable

# These probabilities are EXACT!!

querygrain(Norman.net,nodes=c("E","B","S","L","S2","L2"),type="marginal")

querygrain(Norman.net,nodes=c("S","S2"), type="joint")


#Question 1

Norman.net.1<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("false","false"))

Norman.net.1


predOT<-querygrain(Norman.net.1,nodes=c("L","S","E","S2","L2"), type="joint")
predOT



#Question 2
Norman.net.2<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("true","true"))

Norman.net.2


predOT<-querygrain(Norman.net.2,nodes=c("L","S","E","S2","L2"), type="joint")
predOT


#Question 3

Norman.net.3<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("true","false"))

Norman.net.3


predOT<-querygrain(Norman.net.3,nodes=c("L","S","E","S2","L2"), type="joint")
predOT



#### Model 2  KIT B



tf<-c("false","true")

# Specify the CPTs:
node.E<-cptable(~ E, values=c(2,8),levels=tf)
node.B<-cptable(~ B , values=c(9,1), levels=tf)
node.B2<-cptable(~ B2 , values=c(9,1), levels=tf)
node.S<-cptable(~ S + E , values=c(9.9,0.1,0.3,9.7), levels=tf)
node.L<-cptable(~ S + B, values=c(1,0,0.72,0.28), levels=tf)
node.S2<-cptable(~ S2 + E , values=c(9.9,0.1,0.3,9.7), levels=tf)
node.L2<-cptable(~ S2 + B2, values=c(1,0,0.72,0.28), levels=tf)

plist<-compileCPT(list(node.E,node.B,node.B2,node.S,node.L,node.S2,node.L2))
plist
plist$E
plist$B
plist$B2
plist$S
plist$L
plist$S2
plist$L2

# Create a network of name "Norman.net", for instance:

Norman.net<-grain(plist)
summary(Norman.net)

# The graph:

plot1=plot(Norman.net)
plot1

# We can compute the marginal probability

# of each variable

# These probabilities are EXACT!!

querygrain(Norman.net,nodes=c("E","B","B2","S","L","S2","L2"),type="marginal")

querygrain(Norman.net,nodes=c("S","S2"), type="joint")


#Question 1

Norman.net.1<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("false","false"))

Norman.net.1


predOT<-querygrain(Norman.net.1,nodes=c("L","S","E","S2","L2"), type="joint")
predOT



#Question 2
Norman.net.2<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("true","true"))

Norman.net.2


predOT<-querygrain(Norman.net.2,nodes=c("L","S","E","S2","L2"), type="joint")
predOT


#Question 3

Norman.net.3<-setEvidence(Norman.net,nodes=c("S","S2"),
                          states=c("true","false"))

Norman.net.3


predOT<-querygrain(Norman.net.3,nodes=c("L","S","E","S2","L2"), type="joint")
predOT



