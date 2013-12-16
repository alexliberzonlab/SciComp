# start from ipython --pylab

from scipy.optimize import minimize

# part 1: 1D cost landscape

# define our cost function
def mycostfun(x):
	return (x * exp(-(x**2))) + ((x**2)/20.0)

# Map J

x = linspace(-10, 10, 201)
J = mycostfun(x)
plot(x, J, 'b-')
xlabel('parameter value x')
ylabel('cost function J')

# Optimize x

# an initial guess at the parameter value
x0 = -5.0

# optimize!
opt_result = minimize(mycostfun, x0, method="Nelder-Mead")
print opt_result

x_opt = opt_result["x"]
min_cost = opt_result["fun"]

print "initial guess was x = " + str(x0)
print "the optimal value of x is " + str(x_opt)
print "the minimum cost found is " + str(min_cost)


# part 2: 2D cost landscape

# define our cost function
def mycostfun(X):
	x,y = X[0],X[1]
	return (x * exp(-(x**2)-(y**2))) + (((x**2)+(y**2))/20.0)

# Map J

#xxx

# Optimize (x,y)

# an initial guess at the parameter values
X0 = [-5.0, -5.0]

# optimize!
opt_result = minimize(mycostfun, X0, method="Nelder-Mead")
print opt_result

X_opt = opt_result["x"]
min_cost = opt_result["fun"]

print "initial guess was (x,y) = " + str(X0)
print "the optimal value of (x,y) is " + str(X_opt)
print "the minimum cost found is " + str(min_cost)
