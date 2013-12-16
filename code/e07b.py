# start ipython instead of plain python, with:
# ipython --pylab
# (this loads mathy stuff and plotting stuff automagically)
# and then run the program from within iPython by typing:
# %load e07b.py
# and then hit ENTER twice

x = 612
guesses = (5,10,20,40,80)
iters = range(1,11)
for i_guess in guesses:
    errors = zeros((len(iters))) # initialize an array
    for i_iters in range(0,len(iters)):
        print "testing %d iterations with intial guess %d" % (iters[i_iters], i_guess)
        i = 0
        xi = i_guess
        while (i < iters[i_iters]):
            xi = xi - ((xi*xi)-x) / (2*xi)
            i = i + 1
        print "after %d iterations, sqrt(%.5f) = %.5f" % (i, x, xi)
        err = xi - sqrt(x)
        errors[i_iters] = err
        print "the error is " + str(err)
    plot(iters, errors, '.-')

# in the plot that results you can see that the different lines
# (corresponding to the different initial guesses) all decrease quite
# rapidly with the number of iterations and that there is some
# dependence on the initial guess

