x = 612;
figure
hold on % set up the figure so that successive plot() commands overlay lines
guesses = [5,10,20,40,80];
iters = 1:10;
for i_guess = guesses
    errors = zeros(length(iters),1); % initialize an array
    for i_iters = 1:length(iters)
        disp(['testing ',num2str(iters(i_iters)),' iterations with intial guess ',num2str(i_guess)]);
        i = 0;
        xi = i_guess;
        while (i < i_iters)
            xi = xi - ((xi*xi)-x) / (2*xi);
            i = i + 1;
        end
        disp(['after ',num2str(i),' iterations, sqrt(',num2str(x),') = ',num2str(xi)]);
        err = xi - sqrt(x);
        errors(i_iters) = err;
        disp(['the error is ',num2str(err)]);
    end
    plot(iters, errors, '.-')
end

% in the plot that results you can see that the different lines
% (corresponding to the different initial guesses) all decrease quite
% rapidly with the number of iterations and that there is some
% dependence on the initial guess

