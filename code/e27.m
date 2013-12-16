% part 1: 1D cost landscape

% Map J

x = linspace(-10,10,201); % sample from -10 to +10 in 200 steps
J = mycostfun1d(x);       % compute cost function over all values
figure                    % visualize the cost landscape
plot(x,J,'b-','linewidth',2);
xlabel('X');
ylabel('J');

% Optimize x

X0 = -8.0;                                % initial guess
[Xf,FVAL] = fminsearch('mycostfun1d', X0); % optimize!
hold on
plot([Xf,Xf], get(gca,'ylim'), 'color','r', 'linewidth',2);


% part 2: 2D cost landscape

% Map J

x = linspace(-10,10,51); % sample from -10 to +10 in 50 steps
y = linspace(-10,10,51);
XY = combvec(x,y);
J = mycostfun2d(XY');     % compute cost function over all values
[Y,X] = meshgrid(x,y);    % reshape into matrix form
Z = reshape(J,length(x),length(y));
figure                    % visualize the cost landscape
meshc(X,Y,Z);
shading flat
xlabel('X');
ylabel('Y');
zlabel('J');

% Optimize (x,y)

X0 = [-8.0, 8.0];                          % initial guess
[Xf,FVAL] = fminsearch('mycostfun2d', X0); % optimize!
hold on
z0 = get(gca,'zlim');
z0 = z0(1);
plot3([Xf(1),Xf(1)],[get(gca,'ylim')],[z0 z0],'color','r','linewidth',2);
plot3([get(gca,'xlim')],[Xf(2),Xf(2)],[z0 z0],'color','r','linewidth',2);
