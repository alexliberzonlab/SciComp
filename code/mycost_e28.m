function out = mycost_e28(B)

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
y = [18, 5, 17, 38, 40, 106, 188, 234, 344, 484];

y_pred = B(1) + B(2)*x + B(3)*x.^2 + B(4)*x.^3;

out = sum((y_pred-y).^2);

end