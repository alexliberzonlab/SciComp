fibR <- function(n){
    if (n == 1) {
        return(0)
    }
    else if (n == 2) {
        return(1)
    }
    else {
        return(fibR(n-2) + fibR(n-1))
    }
}

n <- as.integer(readline("Which Fibonacci number do you want? "))
cat("Fibonacci number",n,"is equal to",fibR(n),"\n")
