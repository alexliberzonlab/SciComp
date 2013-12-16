x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [18, 5, 17, 38, 40, 106, 188, 234, 344, 484];

% the "@" symbol denotes a function handle
b = fminsearch(@e28cost, randn(1,4), [], x, y, @e28mod);

plot(x, y, 'b.', 'markersize', 30)
hold on

xhat = linspace(min(x),max(x),200);
yhat = e28mod(b,xhat);
plot(xhat, yhat, 'g-', 'linewidth', 2)
