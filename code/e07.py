from math import sqrt
x = float(raw_input("Enter a number x and I will compute sqrt(x):"))
niter = int(raw_input("How many iterations? "))
i = 0
xi = 10
while (i < niter):
    xi = xi - ((xi*xi)-x) / (2*xi)
    i = i + 1
print "after %d iterations, sqrt(%.5f) = %.5f" % (i, x, xi)
err = xi - sqrt(x)
print "the error is " + str(err)
