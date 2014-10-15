% Chao's good idea
% search for plaintext with largest # spaces

cipher = importdata('p059_cipher.txt', ',');
alpha = double('a'):double('z'); % 97:122
allkeys = combvec(alpha,alpha,alpha)'; % 17576 x 3 matrix of all of them

numspaces = ones(size(allkeys,1),1)*NaN;
for i=1:size(allkeys,1)
    pa = XORdecrypt(cipher, allkeys(i,:));
    numspaces(i) = length(find(pa==32));
    disp(num2str(i));
end
[y,i] = max(numspaces);

