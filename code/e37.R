library(foreach)
library(doMC)

registerDoMC(cores=4)

foreach (i=1:10, .combine=c) %dopar% {
	cat("hello from iteration",i,"\n")
}