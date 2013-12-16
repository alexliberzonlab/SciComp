// compile with: gcc -o e05 e05.c

#include <stdio.h>

int main(int argc, char *argv[]) {

  printf("Fahrenheit Celsius C\n");
  int i;
  for (i=0; i<=90; i+=10) {
    printf("%10.2f %7.2f %6.2f\n", (double) i, ((double)i-32)*5/9, ((double)i-30)/2);
  }

  return 0;
}

