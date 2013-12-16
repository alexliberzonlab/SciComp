g = input('enter a value for g: ');
v0 = input('enter a value for v0: ');
theta = input('enter a value for theta: ');
x = input('enter a value for x: ');
y0 = input('enter a value for y0: ');

y = (x * tan(theta)) - (1.0/(2.0*(v0^2)) * ((g*(x^2))/(cos(theta)^2))) + y0;

disp(['The vertical height of the ball is: ',num2str(y)]);
