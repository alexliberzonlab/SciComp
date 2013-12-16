# part 1
x = linspace(1,100,100);
y = (0.15 * x) + randn(1,100);
plot(x,y,'b.','markersize',15)
title('Noisy Data')
xlabel('X')
ylabel('Y')

# part 2
hold on
z = ((x * 0.05) + 2) + randn(1,100)
plot(x,z,'r.','markersize',15)
ylabel('Y,Z')
legend('Y','Z','location','northwest')
