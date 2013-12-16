// compile with:
// gcc -o goplate goplate.c platemethod.c -lm

// demo of computing the preferred direction of a neuron
// using the "plate method" described in:
// Gribble PL, Scott SH (2002) J. Neurosci. Methods 113(2):185-195

#include <stdio.h>
#include "platemethod.h"

int main(int argc, char *argv[]) {

  double celldirs[] = {0, 0.7854, 1.5708, 2.3562, 3.1416, 3.9270, 4.7124};
  double cellspks[] = {3,      4,      8,     12,     19,      6,      2};
  double plateout[9];

  platemethod(celldirs, cellspks, 7, plateout);

  printf("\ncelldirs: ");
  show_double_vec(celldirs, 7);
  printf("\ncellspks: ");
  show_double_vec(cellspks, 7);
  printf("\nPD =  %7.3f deg\n\n", plateout[0]*180.0/M_PI);

  return 0;
}
