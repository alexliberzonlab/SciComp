# part 1
x = [1,2,3,4,5]
y1 = [1,2,3,4,4]
y2 = [1,5,6,8,10]
y3 = [5,4,2,2,1]
plot(x,[y1;y2;y3]','.-','markersize',35, 'linewidth',3)
xlabel('X')
ylabel('Y')

# part 2
legend('Y1','Y2','Y3', 'location', 'northwest')
