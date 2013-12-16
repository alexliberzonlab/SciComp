// compile with: gcc -o e38_q1 e38_q1.c

#include <stdio.h>
#include <stdlib.h>

// helper functions (see below)
//
double mean(double x[], int n);
void randperm(int perm[], int n);

int main(int argc, char *argv[]) {

  // Question 1

  double x[] = {3,5,4,3,6,7,-1,2,-3,-4,2,-5,3,2,-1};
  double y[] = {2,7,4,7,6,9,-1,3,-2,-1,3,-1,2,4,2};
  double d = mean(y,15) - mean(x,15);
  int bootcount = 0;
  int i, j;
  int nboot = 1e6;
  double xy[30];
  double di;
  for (i=0; i<30; i++) {
    if (i<15) xy[i] = x[i];
    else xy[i] = y[i-15];
  }
  int seq[30];
  double xi[15], yi[15];

  for (i=0; i<nboot; i++) {
    randperm(seq, 30);
    for (j=0; j<30; j++) {
      if (j<15) xi[j] = xy[seq[j]];
      else yi[j-15] = xy[seq[j]];
    }
    di = mean(yi,15) - mean(xi,15);
    if (di >= d) bootcount = bootcount + 1;
  }
  double pboot = (double)bootcount / (double)nboot;
  printf("pboot = %7.5f\n", pboot);

  return 0;
}

/* ---------- HELPER FUNCTIONS ---------- */

double mean(double x[], int n) {
  int i;
  double m = 0.0;
  for (i=0; i<n; i++) {
    m = m + x[i];
  }
  m = m /n;
  return m;
}

void randperm(int perm[], int n) {
  int i, j, t;
  for(i=0; i<n; i++)
    perm[i] = i;
  for(i=0; i<n; i++) {
    j = rand()%(n-i)+i;
    t = perm[j];
    perm[j] = perm[i];
    perm[i] = t;
  }
}
