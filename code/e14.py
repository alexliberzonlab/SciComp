from numpy import *
from numpy.linalg import inv

# enter the data as column vectors
inc = array([50,35,80,25,90,75,65,95,70,110],"float")
inc = inc * 1000
age = array([35,40,45,25,70,55,50,60,45,50],"float")
edu = array([4,2,6,0,4,6,4,6,8,8],"float")

# dependent variable Y
Y = inc
# matrix of independent variables
# including a column of 1s
X = array([ones(len(age)), age, edu])
X = transpose(X)

# find beta weights for:
# Y = X * b
b = dot(dot(inv(dot(X.T, X)), X.T), Y)

# estimated values of Y
Yhat = dot(X, b)

print b
