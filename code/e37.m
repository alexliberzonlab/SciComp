matlabpool open
parfor i=1:10
%for i=1:10
  disp(['hello from iteration #',num2str(i)]);
end
matlabpool close
