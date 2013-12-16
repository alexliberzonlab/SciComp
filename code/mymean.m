function m = mymean(x)
  n = length(x);
  m = 0;
  for i = 1:n
    m = m + x(i);
  end
  m = m / n;
