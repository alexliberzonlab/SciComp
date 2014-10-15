import urllib2      # to open file from a URL
from numpy import * # for arrays

# read in the ciphertext file from the interwebs
response = urllib2.urlopen("https://projecteuler.net/project/resources/p059_cipher.txt")
responsestring = response.read()
cipherascii = fromstring(responsestring, sep=",", dtype="int")

def XORdecrypt(cipherascii, keyascii):
        # initialize plainascii with zeros
        plainascii = zeros(shape(cipherascii), dtype="int")
        i = 0
        keylen = len(keyascii)
        while (i<len(cipherascii)):
                plainascii[i] = cipherascii[i] ^ (keyascii[i % keylen]) # note the modulo operator
                i = i +1
        return plainascii

# generate all possible keys
#
keys = zeros((26*26*26,3), dtype="int")
i = 0
for i1 in range(97,123):
        for i2 in range(97,123):
                for i3 in range(97,123):
                        keys[i,:] = i1,i2,i3
                        i = i + 1

print shape(keys)

max_spaces = 0
best_key = 0
for i in range(shape(keys)[0]):
	keystring = ''.join(map(chr,keys[i,:]))
	ps = getPlaintext(cipherascii, keystring)
	ps_ascii_array = array(map(ord,ps))
	numspaces = len(where(ps_ascii_array == 32)[0])
	if (numspaces > max_spaces):
		max_spaces = numspaces
		best_key = i
	print i

the_key = ''.join(map(chr,keys[best_key,:]))
ps = getPlaintext(cipherascii, the_key)
