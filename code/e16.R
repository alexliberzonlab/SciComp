filename <- "e16data.csv"
d <- read.table(filename, sep=",", col.name=c("pizza","banana"))
mean1 <- mean(d[,1])
mean2 <- mean(d[,2])