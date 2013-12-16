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

# test the function
#
a <- c(1,2,3,4,5)
am <- mymean(a)
cat(am,"\n")
