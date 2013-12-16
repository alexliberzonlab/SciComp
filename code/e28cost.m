function out = e28cost(b,x,y,ff)

	y_est = ff(b,x);
	out = sum((y_est-y).^2);
