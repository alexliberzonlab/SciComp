function out = XORdecrypt(in,key)
  out = ones(size(in)) * NaN; % initialize with NaNs
  keyarray = repmat(key, 1, ceil(length(in)/length(key)));
  keyarray = keyarray(1:length(in));
  out = bitxor(in, keyarray);
