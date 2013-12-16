# part 1: 1D cost landscape

# define the cost function
mycostfun <- function(x) {
	J <- (x * exp(-(x**2))) + ((x**2)/20.0)
	J
}

# Map J

x <- seq(-10, 10, 0.1)
J <- mycostfun(x)
plot(x, J, "l", col="blue", lwd=2, xlab="parameter value x", ylab="cost function J")

# Optimize x

# an initial guess
x0 <- -5.0

# optimize!
optim_res <- optim(x0, mycostfun, method="Nelder-Mead")
print(optim_res)

x_opt <- optim_res$par
min_cost <- optim_res$value

cat(paste("initial guess was", x0, "\n"))
cat(paste("the optimal value of x is", x_opt, "\n"))
cat(paste("the minimum cost found is", min_cost, "\n"))

# note that R gives us a warning about using Nelder-Mead for
# one-dimensional optimization and suggests we use the "Brent"
# method instead. You could try this as an exercise... You will
# need to give optim() lower and upper bounds on the parameter, e.g.:

optim_res <- optim(x0, mycostfun, method="Brent", lower=-20.0, upper=20.0)
print(optim_res)


# part 2: 2D cost landscape

# Map J

xxx

# Optimize (x,y)
