% part 1
x = linspace(0.0, 0.9, 10)
y = sin(2*pi*x)
plot(x, y, 'k-')
box off
xlabel('x')
ylabel('y')

% part 2
x = linspace(0.0, 0.9, 100)
y = sin(2*pi*x)
plot(x, y, 'k-')
box off
xlabel('x')
ylabel('y')

% part 3
plot(x, y, 'b-', 'linewidth', 5)
box off
xlabel('x')
ylabel('y')
