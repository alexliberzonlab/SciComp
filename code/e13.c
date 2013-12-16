// compile with: gcc -o e13 e13.c

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

double mystd(double x[], int xlen) {
  double s = 0;
  int i;
  double xm = mymean(x, xlen);
  for (i=0; i<xlen; i++) {
    s += (x[i]-xm) * (x[i]-xm);
  }
  s = s / (xlen-1);
  return s;
}

int main(int argc, char const *argv[])
{
  double x[5] = {1.0, 2.0, 3.0, 4.0, 5.0};
  int xlen = 5;
  double xs = mystd(x, xlen);
  printf("the std of x is %.3f\n", xs);

  return 0;
}
