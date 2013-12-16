# ipython --pylab

# part 1
x = linspace(0.0, 0.9, 10)
y = sin(2*pi*x)
plot(x, y, 'k-')
xlabel('x')
ylabel('y')

# part 2
x = linspace(0.0, 0.9, 100)
y = sin(2*pi*x)
clf()
plot(x, y, 'k-')
xlabel('x')
ylabel('y')

# part 3
clf()
plot(x, y, 'b-', linewidth=5)
xlabel('x')
ylabel('y')
