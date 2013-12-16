

% load in the cipher1.txt file into an array of ints
%
cipher = importdata('cipher1.txt', ',');

% import a dictionary of English words
%
w = importdata('/usr/share/dict/words', '\n');

% test all 26*26*26 = 17576 keys
%
alpha = double('a'):double('z'); % 97:122
allkeys = combvec(alpha,alpha,alpha)'; % 17576 x 3 matrix of all of them

% let's test all keys
%
bestkey = 1;
bestscore = 0;
for i=1:size(allkeys,1)
  pa = XORdecrypt(cipher, allkeys(i,:)); % decrypt into plaintext array
  p = char(pa);				 % convert to characters
  pw = strsplit(p, ' ');	         % split plaintext by ' ' into words
  % count how many plaintext words are found in the dictionary
  nwords = 0;
  for j=1:length(pw)
    % only words length 3 through 8
    if ( (length(pw{j}) >= 3) & (length(pw{j}) <= 8) )
      if ~isempty(find(strcmp(pw{j},w))) % is it in the dictionary?
	nwords = nwords + 1;
      end
    end
  end
  if nwords > bestscore			 % do we have a new best score?
    bestscore = nwords;
    bestkey = i;
  end
  disp([num2str(i),' ',char(allkeys(i,:)),' score= ',num2str(nwords),' bestscore= ',num2str(bestscore),' bestkey= ',char(allkeys(bestkey,:))]);
end

% here is the best plaintext
p = char(XOEdecrypt(cipher, allkeys(bestkey,:)));
disp(['plaintext:\n',p]);
% and the key that produced it
disp(['best key: ',char(allkeys(bestkey,:))]);
