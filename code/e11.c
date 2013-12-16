// compile with: gcc -o e11 e11.c
//
#include <stdio.h>
#include <stdlib.h> // for rand()
#include <time.h>   // for time()

int main(int argc, char *argv[]) {

  int n;
  if (argc == 1) n = 1000;
  else n = atoi(argv[1]);
  srand((int)time(NULL));
  int n_inside = 0;
  int n_outside = 0;
  int i;
  double x1, y1, x2, y2, d, r, pi_est;
  r = 0.5;
  x1 = 0.5;
  y1 = 0.5;
  for (i=0; i<n; i++) {
    x2 = (double) rand() / RAND_MAX;
    y2 = (double) rand() / RAND_MAX;
    d = ((x2-x1)*(x2-x1)) + ((y2-y1)*(y2-y1));
    if (d < (r*r)) n_inside = n_inside + 1;
    else n_outside = n_outside + 1;
  }
  pi_est = (double)n_inside / (double)n * 4.0;
  printf("after %d darts, n_inside=%d, n_outside=%d, pi_est=%.10f\n",
	 n, n_inside, n_outside, pi_est);
  
  return 0;
}
