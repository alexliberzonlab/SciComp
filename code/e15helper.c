#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "e15helper.h"

// a function to free int_array memory
//
void int_array_destroy(int_array *ia) {
  if (ia->array != NULL) free(ia->array);
  free(ia);
}

// a function to read the cipher1.txt file and return an int_array
//
int_array *readCipherFile(char fname[]) {
  FILE *fid = fopen(fname, "r");  // open the ciphertext file
  long filesize;
  fseek(fid, 0L, SEEK_END);	  // count how many characters in the file
  filesize = ftell(fid);
  rewind(fid);
  char buf[filesize]; 		  // allocate a character buffer to store file contents
  fscanf(fid, "%s", buf);	  // read in the file into the char buffer
  fclose(fid);
  int n_cipher = 0;		  // parse char buffer into an array of integers
  char *token;
  char *bufcpy = strdup(buf);
  token = strtok(bufcpy, ",");	  // split by comma
  while (token) {
    n_cipher++;			  // count how many there are
    token = strtok(NULL, ",");
  }
  free(bufcpy);
  // allocate an array of ints
  int *ia = malloc(n_cipher * sizeof(int));
  bufcpy = strdup(buf);
  token = strtok(bufcpy, ",");	 // read tokens into the int array
  int i=0;
  while (token) {
    ia[i] = atoi(token);
    token = strtok(NULL, ",");
    i++;
  }
  free(bufcpy);
  free(token);
  // stick the data into a new int_array struct
  int_array *cipherarray = malloc(sizeof(cipherarray));
  cipherarray->n = n_cipher;
  cipherarray->array = ia;
  return cipherarray;
}

// a function to take a candidate key and the cipherarray and
// produce candidate plaintext int_array
//
int_array *XORdecrypt(int_array *cipherarray, char key[3]) {
  int_array *plainarray = malloc(sizeof(int_array));
  plainarray->n = cipherarray->n;
  plainarray->array = malloc(plainarray->n * sizeof(int));
  int i=0;
  while (i<plainarray->n) {
    plainarray->array[i] = cipherarray->array[i] ^ (int) key[i % 3];
    i++;
  }
  return plainarray;
}

// a function to take an int_array and generate the
// character string equivalent
//
char *int_array2string(int_array *ia) {
  // leave room for NULL termination
  char *ca = malloc( ((ia->n)+1) * sizeof(char) );
  int i;
  for (i=0; i<ia->n; i++) {
    ca[i] = (char) ia->array[i];
  }
  ca[i] = '\0';	// NULL terminate the string
  return ca;
}

// a function to take an int_array and score how "English" it is
// according to letter frequencies
// lower values -> more "English"
//
double EnglishScore(int_array *b) {
  //
  // based on expected frequencies of single characters in english
  // http://en.wikipedia.org/wiki/Letter_frequency
  //
  // a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
  // 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
  //
  // frequencies of English a-z
  double letterfreqs[] = {	0.08000, 0.01536, 0.02576, 0.03179, 0.12576, 0.03505,
				0.01983, 0.06237, 0.06920, 0.00145, 0.00740, 0.04057,
				0.02561, 0.06904, 0.07591, 0.01796, 0.00118, 0.05959,
				0.06341, 0.09085, 0.02842, 0.00982, 0.02225, 0.00180,
				0.01901, 0.00079 };

  int bfreqs[256];	    // to store freqs of plaintext chars
  int i;
  for (i=0; i<256; i++) {
    bfreqs[i] = 0;	    // initialize to zero
  }
  int blen = b->n;
  int ic;
  for (i=0; i<blen; i++) {
    ic = (unsigned int) b->array[i];
    if ((ic >= 'A') & (ic <= 'Z')) {	// uppercase letter
      ic += ('a' - 'A');          	// convert to lowercase
    }
    bfreqs[ic]++;	           // increment counter for the given letter
  }
  double score = 0.0;
  double diff;
  for (i=0; i<256; i++) {          // compare plaintext freqs to English freqs
    if ((i >= 'a') & (i <= 'z')) { // only include a-z
      diff = ((double) bfreqs[i]) - (letterfreqs[i-'a'] * ((double) b->n));
    }
    else {
      diff = (double) bfreqs[i];
    }
    score += fabs(diff) / ((double) b->n);
  }
  return score;
}
