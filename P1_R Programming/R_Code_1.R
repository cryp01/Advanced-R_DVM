library(MASS)
whiteside
? whiteside
names(whiteside)
summary(whiteside)
whiteside$Temp
whiteside$Gas
plot(Gas ~ Temp, data=whiteside, pch=16)
plot(Gas ~ Temp, data=whiteside, pch=16, main="Gas consumption Whiteside")

#install.packages("lattice")
library(lattice)
? xyplot
xyplot(Gas ~ Temp | Insul, whiteside)
xyplot(Gas ~ Temp | Insul, whiteside, panel = 
function(x, y, ...) {
  panel.xyplot(x, y, ...)
  panel.lmline(x, y, ...)}, 
  xlab = "Average external temperature (deg. C)",
  ylab = "Gas consumption (1000 cubic feet)", aspect = "xy",
  strip = function(...) strip.default(..., style = 1))

rm(list=ls())
 
elasticband <- data.frame(stretch = c(46,54,48,50,44,42,52),
                          distance = c(148,182,173,166,109,141,166)) 
elasticband
                          