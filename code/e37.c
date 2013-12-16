// compile with: gcc -o e37 e37.c -fopenmp

#include <stdio.h>
#include <omp.h>

int main(int argc, char *argv[]) {

  int i;

  #pragma omp parallel for
  for (i=0; i<10; i++) {
    printf("hello from iteration %d\n", i);
  }

  return 0;
}
