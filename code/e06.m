n = input('enter n: ');
sum = 0;
for i=1:n
  sum = sum + i;
end;
disp(['the sum of the first ',num2str(n),' positive integers is: ',num2str(sum)]);
