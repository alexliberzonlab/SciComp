# enter the data as column vectors
inc <- c(50,35,80,25,90,75,65,95,70,110)
inc <- inc * 1000
age <- c(35,40,45,25,70,55,50,60,45,50)
edu <- c(4,2,6,0,4,6,4,6,8,8)

# dependent variable Y
Y <- matrix(inc, ncol=1)
# matrix of independent variables
# including a column of 1s
X <- matrix(c(rep(1,length(age)), age, edu), ncol=3)

library(MASS) # to get ginv() function
# find beta weights for:
# Y = X * b
b <- ginv(t(X) %*% X) %*% t(X) %*% Y

# estimated values of Y
Yhat <- X %*% b

cat("b = ", b)
