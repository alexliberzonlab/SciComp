% Question 1
%
x = [3 5 4 3 6 7 -1 2 -3 -4 2 -5 3 2 -1];
y = [2 7 4 7 6 9 -1 3 -2 -1 3 -1 2 4 2];
nboot = 1e6;
d_boot = ones(1,nboot) * NaN;
nx = length(x);
ny = length(y);
d_obs = mean(y)-mean(x);
xy = [x,y];
nxy = length(xy);

tic
for i=1:nboot
	% generate new x ix and new y iy
	ixy = randi(nxy,1,nxy);
	ix = xy(ixy(1:nx));
	iy = xy(ixy(nx+1:end));
	% recompute d statistic
	d_boot(i) = mean(iy)-mean(ix);
end
toc
p = length(find(d_boot>=d_obs)) / nboot;
disp(['p=',num2str(round(p*1000)/1000)])

% Question 2
%
matlabpool open
x = [3 5 4 3 6 7 -1 2 -3 -4 2 -5 3 2 -1];
y = [2 7 4 7 6 9 -1 3 -2 -1 3 -1 2 4 2];
nboot = 1e6;
d_boot = ones(1,nboot) * NaN;
nx = length(x);
ny = length(y);
d_obs = mean(y)-mean(x);
xy = [x,y];
nxy = length(xy);

tic
parfor i=1:nboot
	% generate new x ix and new y iy
	ixy = randi(nxy,1,nxy);
	ix = xy(ixy(1:nx));
	iy = xy(ixy(nx+1:end));
	% recompute d statistic
	d_boot(i) = mean(iy)-mean(ix);
end
toc
p = length(find(d_boot>=d_obs)) / nboot;
disp(['p=',num2str(round(p*1000)/1000)])
matlabpool close
