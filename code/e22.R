# part 1
x <- seq(1,100,1)
y <- (0.15 * x) + rnorm(100, 0.0, 1.0)
plot(x,y,type="p",col="blue",main="Noisy Data",pch=19, ylab="Y")

# part 2
plot(x,y,type="p",col="blue",main="Noisy Data",pch=19, ylab="Y,Z")
z = ((x * 0.05) + 2) + rnorm(100, 0.0, 1.0)
points(x,z,col="red",pch=19)
legend("topleft", legend=c("Y","Z"), col=c("blue","red"), pch=19)
