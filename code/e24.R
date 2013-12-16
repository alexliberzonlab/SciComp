# part 1
y <- rnorm(1000)
hist(y, col="blue")

# part 2
hist(y, col="blue", bins=25)

# part 3
b = seq(-4,4,0.2) # define our bin boundaries
hist(y, col="blue", breaks=b)

