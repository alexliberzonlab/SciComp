# part 1
x = seq(0.0, 0.9, 0.1)
y = sin(2*pi*x)
plot(x, y, type="l", bty="l") # bty for no box

# part 2
x = seq(0.0, 0.0, 0.01)
y = sin(2*pi*x)
plot(x, y, type="l", bty="l")

# part 3
plot(x, y, type="l", bty="l", col="blue", lwd=10)
