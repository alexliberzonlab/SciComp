function s = mystd(x)
  n = length(x);
  xm = mymean(x);
  s = 0;
  for i = 1:n
    s = s + (x(i)-xm)^2;
  end
  s = s / (n-1);
