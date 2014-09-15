from math import exp, cos, sin, log, pi

def fun1(x):
	return exp(x)

def fun2(x):
	return exp(-2*x*x)

def fun3(x):
	return cos(x)

def fun4(x):
	return log(x)

def numdiff(f, x, h):
	return ( (f(x+h) - f(x-h)) / (2*h) )

h = 0.01

x1 = 0
a1 = numdiff(fun1, x1, h)
e1 = a1 - exp(x1) # the derivative of e^x = e^x
print "\nf(x) = (e^(x)) at x=%.2f is: %.10f\nerror = %.10f" % (x1, a1, e1)

x2 = 1
a2 = numdiff(fun2, x2, h)
e2 = a2 - -4*exp(-2*x2*x2)*x2 # the derivative of e^(-2x^2) = -4e^(-2x^2)x
print "\nf(x) = (e^(-2x^2)) at x=%.2f is: %.10f\nerror = %.10f" % (x2, a2, e2)

x3 = pi/2
a3 = numdiff(fun3, x3, h)
e3 = a3 -  -sin(x3) # the derivative of cos(x) = -sin(x)
print "\nf(x) = cos(x) at x=%.2f is: %.10f\nerror = %.10f" % (x3, a3, e3)

x4 = 1
a4 = numdiff(fun4, x4, h)
e4 = a4 -  1/x4 # the derivative of ln(x) = 1/x
print "\nf(x) = cos(x) at x=%.2f is: %.10f\nerror = %.10f" % (x4, a4, e4)
