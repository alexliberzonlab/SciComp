# part 1
x <- seq(1,100,1)
y = (x * 0.15) + rnorm(100)
z = ((x * 0.05) + 2) + rnorm(100)
par(mfrow=c(2,1)) # set up our grid 2 rows by 1 col
plot(x,y,type="p",col="blue",main="X vs Y",pch=19,ylab="Y",xlab="X")
plot(x,z,type="p",col="red",main="X vs Z",pch=19,ylab="Z",xlab="X")

# part 2
par(mfrow=c(1,2))
plot(x,y,type="p",col="blue",main="X vs Y",pch=19,ylab="Y",xlab="X")
plot(x,z,type="p",col="red",main="X vs Z",pch=19,ylab="Z",xlab="X")

# part 3
# set up a matrix defining figure numbers
m = matrix(c(1,1,2,3),2,2,byrow=TRUE)
layout(m) # set up grid
plot(x,y,type="p",col="blue",main="X vs Y,Z",pch=19,ylab="Y,Z",xlab="X")
points(x,z,col="red",pch=19)
plot(x,y,type="p",col="blue",main="X vs Y",pch=19,ylab="Y",xlab="X")
plot(x,z,type="p",col="red",main="X vs Z",pch=19,ylab="Z",xlab="X")
