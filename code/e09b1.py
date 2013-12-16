def fibR(n):
    if (n == 1):
        return 0
    elif (n == 2):
        return 1
    else:
        return fibR(n-2) + fibR(n-1)

n = int(raw_input("Which Fibonacci number do you want? "))
print "Fibonacci number " + str(n) + " is equal to " + str(fibR(n))
