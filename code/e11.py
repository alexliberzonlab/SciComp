from math import sqrt
from scipy import rand

n_inside = 0
r = 0.5
x1 = 0.5
y1 = 0.5
i = 0
n = 1000
while (i < n):
	x2 = rand()
	y2 = rand()
	d = sqrt(((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1)))
	if (d < r):
		n_inside = n_inside + 1
	i = i + 1
pi_est = float(n_inside) / float(n) * 4.0
print "after %d darts, n_inside=%d, n_outside=%d, pi_est=%.10f" % (n, n_inside, n-n_inside, pi_est)

