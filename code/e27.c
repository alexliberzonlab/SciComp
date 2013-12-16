// e27.c
// compile with: gcc -o e27 e27.c nmsimplex.c

#include <stdio.h>
#include "nmsimplex.h"
#include <math.h>

double mycostfun1d(double x[], void *extras) {
  return (x[0] * exp(-(x[0]*x[0]))) + ((x[0]*x[0])/20);
}

double mycostfun2d(double x[], void *extras) {
  return (x[0] * exp(-(x[0]*x[0])-(x[1]*x[1]))) + (((x[0]*x[0])+(x[1]*x[1]))/20);
}

int main(int argc, char *argv[]) {

  double x1d[] = {-5.0}; // our initial guess
  double f_min1d = simplex(mycostfun1d, x1d, 1, 1e-8, 1, NULL, NULL);
  printf("f_min=%f\n", f_min1d);
  printf("x_min=%f\n", x1d[0]);

  double x2d[] = {-5.0, -5.0}; // our initial guess
  double f_min2d = simplex(mycostfun2d, x2d, 2, 1e-8, 1, NULL, NULL);
  printf("f_min=%f\n", f_min2d);
  printf("x_min=(%f,%f)\n", x2d[0], x2d[1]);

  return 0;
}
