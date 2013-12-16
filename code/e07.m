x = input('Enter a number x and I will compute sqrt(x):');
niter = input('How many iterations? ');
i = 0;
xi = 10;
while (i < niter)
    xi = xi - ((xi*xi)-x) / (2*xi);
    i = i + 1;
end
disp(['after ',num2str(i),' iterations, sqrt(',num2str(x),') = ',num2str(xi)]);
err = xi - sqrt(x);
disp(['the error is ',num2str(err)]);
