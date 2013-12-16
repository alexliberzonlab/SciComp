n_inside <- 0
r <- 0.5
x1 <- 0.5
y1 <- 0.5
i <- 0
n <- 1000
while (i < n) {
    x2 <- runif(1)
    y2 <- runif(1)
    d <- sqrt(((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1)))
    if (d < r) {
        n_inside <- n_inside + 1
    }
    i <- i + 1
}
pi_est <- n_inside / n * 4.0
cat("after",n,"darts, n_inside=",n_inside,",n_outside=",n-n_inside,", pi_est=",pi_est,"\n")
