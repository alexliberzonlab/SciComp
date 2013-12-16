isPrime <- function(x) {
  if (x == 2) {         # x is 2, the first prime
      return (TRUE)
  }
  if (x < 2) {          # x < 2 so not prime
      return (FALSE)
  }
  if ((x %% 2) == 0) {  # x is an even number
      return (FALSE)
  }
  # test every odd number from 3 to sqrt(n)
  i <- 3
  while (i <= sqrt(x)) {
    if ((x %% i) == 0) {  # after division is the remainder zero?
      return (FALSE)      # if yes then it's not prime
    }
    i <- i + 2
  }
  return (TRUE)         # if we found none then it is prime
}

x <- as.integer(readline("Enter a number: "))
cat (x, "is prime:", isPrime(x), "\n")

