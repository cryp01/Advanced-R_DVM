
#scan() - offers a low-level reading facility
#read.table() - can be used to read data frames from formatted text files
#read.csv() - can be used to read data frames from comma separated variable files.

getwd()
url <- "https://raw.githubusercontent.com/isglobal-brge/TeachingMaterials/master/Master_Modelling/data/example.txt"
download.file(url, "example.txt" )

example.data <- read.table("example.txt",header=TRUE)
is.matrix(example.data)
is.data.frame(example.data)
is.list(example.data)

write.table(example.data, "Ex1.txt", row.names=FALSE, sep=" ")
write.table(example.data, "Ex2.txt", row.names=TRUE, sep=" ")
example.data1 <- read.table("Ex2.txt",header=TRUE)
write.table(example.data, "Ex3.txt", row.names=FALSE, sep=", ")
write.csv(example.data, "Ex4.csv", row.names=FALSE)
