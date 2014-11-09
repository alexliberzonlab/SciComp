% exercise 29

% the data
x = 0:0.01:3;
y = sin(2*pi*x) + randn(size(x))*0.5;

% plot it
figure
subplot(1,2,1)
plot(x,y,'bs'); xlabel('X'); ylabel('Y'); title('THE DATA')

% define the model of the data
mymodelfun = @(beta) sin(beta*[0:0.01:3]);

% define cost function
mycost = @(beta) sum((mymodelfun(beta) - y).^2);

% plot the cost landscape
brange = -10:.01:10;
bcost = ones(size(brange))*NaN;
for i=1:length(bcost)
   bcost(i) = mycost(brange(i)); 
end
subplot(1,2,2)
plot(brange, bcost, 'b-', 'linewidth',2);
xlabel('Beta Value'); ylabel('COST'); title('THE COST FUNCTION')


