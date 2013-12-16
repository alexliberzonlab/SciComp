#include <stdio.h>

int main(int argc, char *argv[]) {

  FILE *fid = fopen("data05.bin", "r");
  // read the header
  char hs[16];
  fread(&hs, 16, 1, fid);
  int rows;
  int cols;
  fread(&rows, 4, 1, fid);
  fread(&cols, 4, 1, fid);
  // read 5 integer values for each of two variables
  // format is: v1 v2 v1 v2 v1 v2 v1 v2 v1 v2
  // where v1,v2 are each 4 bytes long
  int v1[5];
  int v2[5];
  int i;
  for (i=0; i<rows; i++) {
    fread(&(v1[i]), 4, 1, fid);
    fread(&(v2[i]), 4, 1, fid);
  }
  fclose(fid);
  
  // print to screen
  for (i=0; i<16; i++) {
    printf("%c", hs[i]);
  }
  printf("\nrows=%d, cols=%d\n", rows, cols);
  for (i=0; i<rows; i++) {
    printf("%3d %3d\n", v1[i], v2[i]); 
  }

  return 0;
}
