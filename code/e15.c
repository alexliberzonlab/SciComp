// to compile: gcc -O3 -o e15 e15.c e15helper.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "e15helper.h"	// header file for e15helper.c

int main(int argc, char *argv[]) {
	
  // read the cipher1.txt file into a int_array struct
  int_array *cipherarray = readCipherFile("cipher1.txt");
  printf("read in %d integers into cipherarray\n", cipherarray->n);

  // brute force method, try every 3-letter key
  // there are 26*26*26 = 17576 possibilities
  // 'a'=97, 'z'=122

  char key[] = "aaa";
  char best_key[] = "aaa";
  int_array *plainarray;
  double s, best_s = 99999.0;
  int i,j,k;
  for (i=97; i<=122; i++) {
    for (j=97; j<=122; j++) {
      for (k=97; k<=122; k++) {
	key[0] = i;
	key[1] = j;
	key[2] = k;
	plainarray = XORdecrypt(cipherarray, key);
	s = EnglishScore(plainarray);
	if (s < best_s) {
	  best_s = s;
	  strcpy(best_key, key);
	}
	printf("%s %5.3f %s %5.3f\n", key, s, best_key, best_s);
	int_array_destroy(plainarray);
      }
    }
  }	

  plainarray = XORdecrypt(cipherarray, best_key);
  char *plaintext = int_array2string(plainarray);
  printf("plaintext:\n%s\nbest_key:%s\n", plaintext, best_key);

  free(plaintext);
  int_array_destroy(plainarray);
  int_array_destroy(cipherarray);
  return 0;
}
