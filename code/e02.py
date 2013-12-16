from math import tan, cos

g = float(raw_input('enter a value for g: '))
v0 = float(raw_input('enter a value for v0: '))
theta = float(raw_input('enter a value for theta: '))
x = float(raw_input('enter a value for x: '))
y0 = float(raw_input('enter a value for y0: '))

y = (x * tan(theta)) - (1.0/(2.0*(v0**2)) * ((g*(x**2))/(cos(theta)**2))) + y0

print "The vertical height of the ball is: ", str(y)

