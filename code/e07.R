x <- as.numeric(readline("Enter a number x and I will compute sqrt(x): "))
niter <- as.integer(readline("How many iterations? "))
i <- 0
xi <- 10
while (i < niter) {
    xi <- xi - ((xi*xi)-x) / (2*xi)
    i <- i + 1
}
cat("after",i,"iterations, sqrt(",x,") = ",xi,"\n")
err <- xi - sqrt(x)
cat("the error is ", err,"\n")
