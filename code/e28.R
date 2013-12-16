# define the cost function
e28cost <- function(b,x,y,fmod) {
	yhat <- fmod(b,x)
	J <- sum((yhat-y)**2)
	J
}

# define the data model
e28mod <- function(b,x) {
	yhat <- b[1] + b[2]*x + b[3]*x*x + b[4]*x*x*x
	yhat
}

# the data
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y <- c(18, 5, 17, 38, 40, 106, 188, 234, 344, 484)

# plot x vs y
plot(x, y, "p", col="blue", pch=19, cex=1.5, xlab="X", ylab="Y")

# initial guess
b0 <- runif(4)

# optimize!
optim_res <- optim(par=b0, fn=e28cost, method="Nelder-Mead", gr=NULL, x, y, e28mod)
print(optim_res)
b_opt <- optim_res$par
min_cost <- optim_res$value
cat(paste("initial guess was", b0, "\n"))
cat(paste("the optimal value of b is", b_opt, "\n"))
cat(paste("the minimum cost found is", min_cost, "\n"))

# plot line of best fit
xhat <- seq(min(x), max(x), (max(x)-min(x))/100)
yhat <- b_opt[1] + b_opt[2]*xhat + b_opt[3]*xhat*xhat + b_opt[4]*xhat*xhat*xhat
lines(xhat, yhat, col="red", lwd=2)