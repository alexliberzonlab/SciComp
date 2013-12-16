#include <stdio.h>

int main(int argc, char *argv[]) {

  FILE *fid = fopen("data05.bin", "w");
  // write the header
  char hs[16] = "October 15, 2013";
  fwrite(&hs, 16, 1, fid);
  int rows = 5;
  int cols = 2;
  fwrite(&rows, 4, 1, fid);
  fwrite(&cols, 4, 1, fid);
  // write 5 integer values for each of two variables
  // format is: v1 v2 v1 v2 v1 v2 v1 v2 v1 v2
  // where v1,v2 are each 4 bytes long
  int v1[5] = {1, 2, 3, 4, 5};
  int v2[5] = {2, 4, 6, 8, 10};
  int i;
  for (i=0; i<5; i++) {
    fwrite(&(v1[i]), 4, 1, fid);
    fwrite(&(v2[i]), 4, 1, fid);
  }
  fclose(fid);
  
  return 0;
}
