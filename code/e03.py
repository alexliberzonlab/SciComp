from math import log, pi

# set up constants

Msmall = 47.0
Mbig = 67.0
rho = 1.038
c = 3.7
K = 0.0054
Tw = 100.0
Ty = 70.0

whichEgg = bool(raw_input('Is the egg large (1) or small (0)? '))

if (whichEgg == 0):
	M=Msmall
else:
	M=Mbig

print 'enter the initial temperature of the egg'
To = float(raw_input('reminder 4.0 for fridge, 20.0 for room: '))

t = (((M**(2.0/3.0))*c*(rho**(1.0/3.0)))/(K*(pi**2)*((4.0*pi/3.0)**(2.0/3.0)))) * log(0.76 * ((To-Tw)/(Ty-Tw)))

print "time taken to cook the egg is: %.3f seconds (%d minutes, %d seconds)" % (t, t/60.0, t%60.0)
