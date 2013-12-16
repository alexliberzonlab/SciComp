disp(['Fahrenheit Celsius C']);
for i=0:10:90
  disp(sprintf('%10.2f %7.2f %6.2f', i, (i-32)*5/9, (i-30)/2));
end;
