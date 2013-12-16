% enter the data as column vectors
inc = [50,35,80,25,90,75,65,95,70,110]';
inc = inc * 1000;
age = [35,40,45,25,70,55,50,60,45,50]';
edu = [4,2,6,0,4,6,4,6,8,8]';

% dependent variable Y
Y = inc;
% matrix of independent variables
% including a column of 1s
X = [ones(length(age),1) age edu];

% find beta weights for:
% Y = X * b
b = inv(X' * X) * X' * Y;

% estimated values of Y
Yhat = X * b;

disp(['b = ',mat2str(b,8)]);
