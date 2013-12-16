# start from ipython --pylab

from scipy.optimize import minimize

# our data
x = array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], dtype="float")
y = array([18, 5, 17, 38, 40, 106, 188, 234, 344, 484], dtype="float")

# plot the data
figure()
plot(x,y,'b.',markersize=15)
xlabel("X")
ylabel("Y")

# define our cost function
def e28costfun(b,x,y,ff):
	y_est = ff(b,x)
	return sum((y_est-y)**2)

# define the model of the data
def e28mod(b,x):
	return b[0] + b[1]*x + b[2]*(x**2) + b[3]*(x**3)

# initial guess at beta parameters
b0 = rand(4,1)
# optimize!
opt_result = minimize(e28costfun, b0, method="Nelder-Mead", args=(x,y,e28mod))
print opt_result

# get predicted values of y
b = opt_result["x"]
c = opt_result["fun"]
xp = linspace(min(x),max(x),100)
yp = e28mod(b, xp)

# plot them
plot(xp, yp, 'r-', linewidth=2)