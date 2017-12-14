

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


# First: which are the possible values of the nodes (all nodes are boolean):

tf<-c("false","true")

# Specify the CPTs:
node.O<-cptable(~ O, values=c(6,4),levels=tf)
node.T<-cptable(~ T, values=c(9,1), levels=tf)
node.N<-cptable(~ N + T, values=c(9,1,2,8), levels=tf)
node.M<-cptable(~ M + O + T, values=c(7,3,4,6,4,6,2,8), levels=tf)

# Create an intermediate representation of the CPTs:

plist<-compileCPT(list(node.O,node.T,node.N,node.M))
plist
plist$O
plist$T
plist$N
plist$M

# Create a network of name "Norman.net", for instance:

Norman.net<-grain(plist)
summary(Norman.net)

# The graph:

plot1=plot(Norman.net)
plot1

# We can compute the marginal probability

# of each variable

# These probabilities are EXACT!!

querygrain(Norman.net,nodes=c("O","T","N","M"),
           type="marginal")
# We can also compute the joint probability of some nodes. For
# instance:
#
querygrain(Norman.net,nodes=c("N","M"), type="joint")

# We can compute the probability of an event given an evidence.
# If evidence is "N=true", in order to compute the probability of the
# other nodes, first we add the evidence to the network and name the
# new BN Norman.net.2:

Norman.net.2<-setEvidence(Norman.net,nodes=c("N"),
                          states=c("true"))

# The marginal distributions given
# the evidence are:

marg=querygrain(Norman.net.2,nodes
                =c("O","T","M"), type="marginal")

# We can obtain the probability of the evidence used in Norman.net.2:

print(getEvidence(Norman.net.2))

# If the evidence now is: N=true & M=true, we construct a new
# BN named Norman.net.3:
#

Norman.net.3<-setEvidence(Norman.net,nodes=c("N","M"),
                          states=c("true","true"))

# The marginals of the nodes O and T when the evidence is
# N=true & M=true, are:
#
nodos=c("O","T")
marg3=querygrain(Norman.net.3,nodes=nodos, type="marginal")

# The following gives the most probable value for each variable,
# given the evidences N=true & M=true.
# It does not imply that the jointly configuration with these values is
# the most probable!!
#

prediction=NULL
confidence.level=NULL
Node=NULL
for (i in 1:length(nodos))
{
  prediction[i]<-tf[which.max(marg3[[i]])]
  confidence.level[i]<-max(marg3[[i]])
}
Node<-as.data.frame(cbind(nodos,prediction,confidence.level))
Node

# The following gives the most probable value for each variable,
# given the evidences N=true & M=true.
# It does not imply that the jointly configuration with these values is
# the most probable!!
#

# Instead, we can obtain the joint probability distribution of nodes O
# and T given the evidences N=true & M=true, and see which is the
# configuration which maximizes the probability:
#

predOT<-querygrain(Norman.net.3,nodes=c("O","T"), type="joint")
predOT
which.max(predOT)

# Therefore, the configuration that maximizes the joint probability
# distribution of O and T, given the evidences N=true & M=true is:
# O=false & T=true, with a confidence level of 0.3123644

