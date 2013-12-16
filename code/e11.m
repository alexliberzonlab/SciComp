n_inside = 0;
r = 0.5;
x1 = 0.5;
y1 = 0.5;
i = 0;
n = 1000;
while (i < n)
  x2 = rand;
  y2 = rand;
  d = sqrt(((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1)));
  if (d < r)
    n_inside = n_inside + 1;
  end
  i = i + 1;
end
pi_est = n_inside / n * 4.0;
disp(['after ',num2str(n),' darts, n_inside=',num2str(n_inside),', n_outside=',num2str(n-n_inside),', pi_est=',num2str(pi_est)])
