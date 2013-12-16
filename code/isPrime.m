function b = isPrime(x)

  if x == 2            % x is 2, the first prime
    b = true;
  elseif x < 2         % x < 2 so not prime
    b = false;
  elseif mod(x,2) == 0 % x is an even number
    b = false;
  else
    % test every odd number from 3 to sqrt(n)
    b = true;
    i = 3;
    while (i <= sqrt(x))
      if mod(x,i) == 0      % after division is the remainder zero?
	b = false;       % if yes then it's not prime
	return
      end
      i = i + 2;
    end
  end
