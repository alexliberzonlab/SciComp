[X,Y] = meshgrid(-8:0.1:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(X,Y,Z)
xlabel('X'); ylabel('Y'); zlabel('Z');
