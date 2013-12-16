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

# define the mystd() function
#
def mystd(x):
    n = len(x)
    s = 0
    xm = mymean(x)
    for i in range(n):
        s = s + ((x[i]-xm)**2)
    s = s / (n-1)
    return s

# test the function
#
a = array([1,2,3,4,5], "float")
a_s = mystd(a)
print str(a_s)
