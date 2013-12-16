fib <- function(n){
    if (n == 1) {
        return(0)
    }
    else if (n == 2) {
        return(1)
    }
    else {
        fprev2 <- 1
        fprev1 <- 1
        fn <- 1
        i <- 3
        while (i < n) {
            fn <- fprev1 + fprev2
            fprev2 <- fprev1
            fprev1 <- fn
            i <- i + 1
        }
        return(fn)
    }
}

n <- as.integer(readline("Which Fibonacci number do you want? "))
cat("Fibonacci number",n,"is equal to",fib(n),"\n")
