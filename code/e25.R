# part 1
x <- seq(1,100,1)
y <- (x * 0.15) + rnorm(100)
plot(x,y,type="p",col="blue",pch=19)
# fit linear model
m <- lm(y ~ x) # fit a linear model
yhat <- predict(m)
lines(x,yhat,col="red",lwd=3)

# part 2
legend(x="topleft", legend=c("raw data","line of best fit"),col=c("blue","red"),pch=c(19,NA),lwd=c(0,3))

# part 3
b <- coef(m) # get b0 and b1 from linear model
eq <- paste(round(b[1],2),"+ (",round(b[2],2),"x )")
plot(x,y,type="p",col="blue",pch=19)
lines(x,yhat,col="red",lwd=3)
legend(x="topleft", legend=c("raw data",eq),col=c("blue","red"),pch=c(19,NA),lwd=c(0,3))
