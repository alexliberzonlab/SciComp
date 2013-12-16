// compile with: gcc -o e07 e07.c

#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[]) {

  printf("Enter a number x and I will compute sqrt(x): ");
  double x;
  scanf("%lf", &x);
  printf("How many iterations? ");
  int niter;
  scanf("%d", &niter);
  int i = 0;
  double xi = 10;
  while (i < niter) {
    xi = xi - ((xi*xi)-x) / (2*xi);
    i = i + 1;
  }
  printf("after %d iterations, sqrt(%.5f) = %.5f\n", i, x, xi);
  double err = xi - sqrt(x);
  printf("the error is %.20f\n", err);

  return 0;
}
