# define the mymean() function
#
mymean <- function(x) {
    n <- length(x)
    m <- 0
    for (i in seq(n)) {
        m <- m + x[i]
    }
    m <- m / n
    m
}

# define the mystd() function
#
mystd <- function(x) {
    n <- length(x)
    s <- 0
    xm <- mymean(x)
    for (i in seq(n)) {
        s <- s + ((x[i]-xm)**2)
    }
    s = s / (n-1)
    s
}

# test the function
#
a <- c(1,2,3,4,5)
asd <- mystd(a)
cat(asd,"\n")
