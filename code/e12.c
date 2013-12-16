// compile with: gcc -o e12 e12.c

#include <stdio.h>
#include <stdlib.h> // for malloc

double mymean(double x[], int xlen) {
  double out = 0;
  int i;
  for (i=0; i<xlen; i++) {
    out += x[i];
  }
  out = out / xlen;
  return out;
}

int main(int argc, char const *argv[])
{
  // define our array x on the stack
  double x[5] = {1.0, 2.0, 3.0, 4.0, 5.0};
  int xlen = 5;
  double xmean = mymean(x, xlen);
  printf("the mean of x is %.3f\n", xmean);

  // or we can define it on the heap
  int ylen = 5;
  double *y  = malloc(ylen * sizeof(double));
  y[0] = 1.0;
  y[1] = 2.0;
  y[2] = 3.0;
  y[3] = 4.0;
  y[4] = 5.0;
  double ymean = mymean(y, ylen);
  printf("the mean of y is %.3f\n", ymean);  
  free(y);

  return 0;
}
