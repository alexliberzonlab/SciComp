x <- 612
guesses <- c(5,10,20,40,80)
iters <- 1:10
firstplot = TRUE
for (i.guess in guesses) {
    errors <- matrix(0,1,length(iters)) # initialize array of 0s
    for (i.iters in iters) {
        cat("testing ",iters[i.iters],"iterations with initial guess ", i.guess)
        i <- 0
        xi <- i.guess
        while (i < iters[i.iters]) {
            xi <- xi - ((xi*xi)-x) / (2*xi)
            i <- i + 1
        }
        cat("after",i,"iterations, sqrt(",x,") = ",xi,"\n")
        err <- xi - sqrt(x)
        errors[i.iters] = err
        cat("the error is ", err,"\n")
    }
    if (firstplot) {
        plot(iters, errors, type="b")
        firstplot = FALSE
    }
    else {
        lines(iters, errors, type="b")
    }
}
