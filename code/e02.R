g <- as.numeric(readline("enter a value for g: "))
v0 <- as.numeric(readline("enter a value for v0: "))
theta <- as.numeric(readline("enter a value for theta: "))
x <- as.numeric(readline("enter a value for x: "))
y0 <- as.numeric(readline("enter a value for y0: "))

y <- (x * tan(theta)) - (1.0/(2.0*(v0**2)) * ((g*(x**2))/(cos(theta)**2))) + y0

cat("The vertical height of the ball is:", y,"\n")

