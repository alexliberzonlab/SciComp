# ipython --pylab

from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure()
ax = fig.add_subplot(111, projection="3d")
x = arange(-8.0, 8.0, 0.1)
y = arange(-8.0, 8.0, 0.1)
X,Y = meshgrid(x, y)
R = sqrt(X**2 + Y**2) + 0.000001
Z = sin(R)/R
ax.plot_surface(X, Y, Z)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
