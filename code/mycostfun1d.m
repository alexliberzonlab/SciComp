function J = mycostfun1d(X)
%
% note use of dot notation on .* and ./ operators
% this enables the computation to happen for
% vector values of x
%
J = (X .* exp(-X.*X)) + ((X.*X)./20);
