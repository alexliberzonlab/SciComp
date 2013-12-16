// e28.c
// compile with: gcc -o e28 e28.c nmsimplex.c

#include <stdio.h>
#include "nmsimplex.h"

// define a struct that will hold extra stuff to be passed
// to the cost function
typedef struct {
  int n;            // length of x,y arrays
  double *x, *y;    // the x,y data arrays
                    // below: a pointer to a function that computes
                    // y estimates based on b, x and n
  double *(*modfn)(double b[], double x[], int n);
} optim_extras;

// our cost function
double e28cost(double b[], void *extras) {
  optim_extras *stuff = (optim_extras *)extras;
  double J = 0.0;
  double *x = stuff->x;
  double *y = stuff->y;
  int i;
  double *(*fn)() = stuff->modfn;                 // the model function
  double *yhat = fn(b, x, stuff->n);              // compute yhat
  for (i=0; i<stuff->n; i++) {
    J = J + ( (yhat[i]-y[i]) * (yhat[i]-y[i]) );  // compute cost
  }
  free(yhat);
  return J;
}

// our model function to compute yhat from b, x and n
double *e28mod(double b[], double x[], int n) {
  double *yhat = malloc(n * sizeof(double));
  int i;
  for (i=0; i<n; i++) {
    yhat[i] = b[0] + (b[1]*x[i]) + (b[2]*x[i]*x[i]) + (b[3]*x[i]*x[i]*x[i]);
  }
  return yhat;
}

// the main program
//
int main(int argc, char *argv[]) {

  double x[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  double y[] = {18, 5, 17, 38, 40, 106, 188, 234, 344, 484};

  optim_extras stuff;     // declare struct of extra stuff
  stuff.n = 10;           // x,y array length
  stuff.x = x;            // x data array
  stuff.y = y;            // y data array
  stuff.modfn = &e28mod;  // the address of the model function e28mod()

  double b[] = {.1,.1,.1,.1};                                   // our initial guess
  double f_min = simplex(e28cost, b, 4, 1e-8, 1, NULL, &stuff); // optimize!
  printf("f_min=%f\n", f_min);
  printf("x_min=(%f,%f,%f,%f)\n", b[0],b[1],b[2],b[3]);

  return 0;
}