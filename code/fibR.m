function fn = fibR(n)
  if (n == 1)
    fn = 0;
  elseif (n == 2)
    fn = 1;
  else
    fn = fibR(n-2) + fibR(n-1);
  end
end
