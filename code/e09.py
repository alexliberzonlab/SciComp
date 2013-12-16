def fib(n):
    if (n == 1):
        return 0
    elif (n == 2):
        return 1
    else:
        fprev2 = 1
        fprev1 = 1
        fn = 1
        i = 3
        while (i < n):
            fn = fprev1 + fprev2
            fprev2 = fprev1
            fprev1 = fn
            i = i + 1
        return fn

n = int(raw_input("Which Fibonacci number do you want? "))
print "Fibonacci number " + str(n) + " is equal to " + str(fib(n))
