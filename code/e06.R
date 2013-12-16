n <- as.integer(readline("enter n: "))
sum <- 0
for (i in 1:n) {
    sum <- sum + i
}
cat("the sum of the first",n,"positive integers is:",sum,"\n")
