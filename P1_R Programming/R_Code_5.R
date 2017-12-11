
Year <-c(1980, 1988, 1996, 1998, 2000, 2002)
Year 
mean_weight <- c(71.5, 72.1, 73.7, 74.3, 75.2, 74.7)
mean_weight
Gender <-c("M", "M", "F", "F", "M", "M")
Gender
mean_height<- c(179.3, 179.9, 180.5, 180.1, 180.3, 180.4)
mean_height

d <- data.frame(mean_weight, Gender)
d

d <- data.frame(mean_weight=c(71.5,72.1,73.7,74.3,75.2,74.7),
                Gender=c("M", "M", "F", "F", "M", "M"))
d

mylist <-list(Year, mean_weight, Gender, mean_height)
names(mylist)
names(mylist) <- c("Year", "mean_weight", "Gender", "mean_height")
names(mylist)

new.data <- as.data.frame(mylist)
new.data
new.data$Year

new.data[3,2]
new.data[,2] #same as new.data$mean_weight
new.data$mean_weight
new.data[new.data$Gender == "M",]
new.data[new.data$Gender == "F" & new.data$Year > 1996, c(2,4)]
new.data[new.data$Gender == "F" & new.data$Year > 1996,]
new.data[new.data$Gender == "F" | new.data$Year > 1996, c(2,4)]
