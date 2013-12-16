from numpy import array

# define the mymean() function
#
def mymean(x):
    n = len(x)
    m = 0
    for i in range(n):
        m = m + x[i]
    m = m / n
    return m

# test the function
#
a = array([1,2,3,4,5], "float")
am = mymean(a)
print str(am)
