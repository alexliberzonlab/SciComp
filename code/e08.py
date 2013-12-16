def isPrime(n):
    if n == 2:       # n is 2, the first prime
        return True
    if n < 2:        # n < 2 so not prime
        return False
    if (n % 2) == 0: # n is an even number
        return False
    # test every odd number from 3 to sqrt(n)
    i=3
    while (i <= n**(0.5)):
        if (n % i) == 0:     # after division is the remainder zero?
            return False     # if yes then it's not prime
        i = i + 2
    return True              # if we found none then it is prime

x = int(raw_input("Enter a number: "))
print "%d is prime: %r" % (x, isPrime(x))

