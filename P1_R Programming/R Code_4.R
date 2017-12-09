
L1 <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9))
L1

L2 <- list("Fred", "Mary", 3, c(4,7,9))
L2

L1[["name"]]
L1$name
L1[[1]]
#A sublist consisting of the rst component only
L1[1]

names(L1)
names(L2) # has no title/name .... so print out will be NULL 
names(L2) <- c("name.hus", "name.wife", "no.child", "child.age")
names(L2)
L3 <- c(L1, L2)