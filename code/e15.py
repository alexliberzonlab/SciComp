import urllib2      # to open file from a URL
from numpy import * # for arrays

# read in the ciphertext file from the interwebs
response = urllib2.urlopen("https://projecteuler.net/project/resources/p059_cipher.txt")
responsestring = response.read()
cipherascii = fromstring(responsestring, sep=",", dtype="int")
# now cipherascii is an array of integers corresponding to 
# ascii codes

# here's a function to decrypt an array of ascii codes
# with a repeating decryption key (also ascii codes)
# using XOR bitwise decryption
#
def XORdecrypt(cipherascii, keyascii):
        # initialize plainascii with zeros
        plainascii = zeros(shape(cipherascii), dtype="int")
        i = 0
        keylen = len(keyascii)
        while (i<len(cipherascii)):
                plainascii[i] = cipherascii[i] ^ (keyascii[i % keylen]) # note the modulo operator
                i = i +1
        return plainascii

# for an example, let's try a guess at a cipherkey
#
cipherkey = "abc"
# convert cipherkey to an array of ascii codes
keyascii = array(map(ord, cipherkey), dtype="int")
plainascii = XORdecrypt(cipherascii, keyascii)
plainchars = map(chr, plainascii)
plainstring = ''.join(plainchars)
print plainstring # nope that doesn't look like English

# let's wrap that into a nice function
#
def getPlaintext(cipherascii, keystring):
        keyascii = array(map(ord, keystring), dtype="int")
        plainascii = XORdecrypt(cipherascii, keyascii)
        plainchars = map(chr, plainascii)
        plainstring = ''.join(plainchars)
        return plainstring

# example:
#
ps = getPlaintext(cipherascii, "abc")
print ps

# ok now we can decrypt given a candidate key.
# now we have to decide if the key was correct
# i.e. correct if the resulting plaintext is English
# There are lots of ways we can proceed.
#
# Let's try this: we'll write a function that will
# take a given string of text as input, and return to us
# a "score" for how "english" it looks. Our "score" will
# simply be the number of words (separated by spaces) in the
# text that are found in an English dictionary

# here's some code that loads english dictionary words
# that are between three and 8 letters long
# from /usr/share/dict/words
#
# note this uses Python's "list comprehension" notation so
# it may look rather obscure
#
Ewords = [w.strip().lower() for w in open("/usr/share/dict/words") if ((len(w.strip())>=3) and (len(w.strip())<=8))]

# and here's a function to count the number of words,
# i.e. chunks of text separated by spaces " ",
# that are found in the dictionary
#
def EnglishScore(plainstring):
        global Ewords 
        Pwords = plainstring.split(" ") # split by spaces
        ecount = 0
        # for each resulting "word" in the plaintext
        for i in range(len(Pwords)):
                # words length 3-8 only
                if ( (len(Pwords[i]) >= 3) and (len(Pwords[i]) <= 8) ):
                        if Pwords[i] in Ewords:
                                ecount = ecount + 1
        return ecount

# ok now let's try all possible keys (26 * 26 * 26 = 17576 of them)
# and for each keep track of the score
# and then keep the one with the max score
# 'a' is 97, 'z' is 122
# generate a matrix of all possible keys and initialize them to zero
#
keys = zeros((26*26*26,3), dtype="int")
i = 0
for i1 in range(97,123):
        for i2 in range(97,123):
                for i3 in range(97,123):
                        keys[i,:] = i1,i2,i3
                        i = i + 1

print shape(keys)

# let's keep track of each key's score
#
scores = zeros((shape(keys)[0],1)) # initialize all to zero

# ok now let's score plaintext for all keys
#
bestscore = 0.0  # best score so far
bestkey = "aaa"  # best key so far
# for each row (key)
for i in range(shape(keys)[0]):
        # slightly obscure code here I admit
        keystring = ''.join(map(chr,keys[i,:]))
        # get the plaintext
        ps = getPlaintext(cipherascii, keystring)
        # score the plaintext
        score = EnglishScore(ps)
        scores[i] = score
        # is score better than best so far?
        if (score > bestscore):
                bestkey = keystring
                bestscore = score
        print "%6d (%s) score=%3d bestscore = %3d bestkey = %s" % (i,keystring,score,bestscore,bestkey)

# and here is the best score, best key and corresponding plaintext
#
print bestscore
print bestkey
ps = getPlaintext(cipherascii, bestkey)
print ps
