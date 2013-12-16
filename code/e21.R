# part 1
x <- c(1,2,3,4,5)
y1 <- c(1,2,3,4,4)
y2 <- c(1,5,6,8,10)
y3 <- c(5,4,2,2,1)
d = matrix(c(y1,y2,y3), nrow=5, ncol=3)
matplot(x, d, type="b", col=c("blue","green","red"), pch=19, lty=1, lwd=3, ylab="Y", xlab="X")

# part 2
legend("topleft", legend=c("Y1","Y2","Y3"), col=c("blue","green","red"), pch=19, lwd=3)
