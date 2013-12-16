function fn = fib(n)
  if (n == 1)
    fn = 0;
  elseif (n == 2)
    fn = 1;
  else
    fprev2 = 1;
    fprev1 = 1;
    fn = 1;
    i = 3;
    while (i < n)
      fn = fprev1 + fprev2;
      fprev2 = fprev1;
      fprev1 = fn;
      i = i + 1;
    end
  end
end
