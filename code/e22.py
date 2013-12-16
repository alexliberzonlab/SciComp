# ipython --pylab

# part 1
x = linspace(1,100,100)
y = (0.15 * x) + randn(100)
plot(x,y,'bo')
title("Noisy Data")
xlabel('X')
ylabel('Y')

# part 2
z = ((x * 0.05) + 2) + randn(100)
plot(x,z,'ro')
legend(("Y","Z"),loc="upper left")
ylabel("Y, Z")
