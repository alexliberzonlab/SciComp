// to compile: gcc -o e08 e08.c
//

#include <stdio.h>

int isPrime(int x) {
  if (x == 2) {
    return 1;
  }
  else if (x < 2) {
    return 0;
  }
  else if ((x % 2) == 0) {
    return 0;
  }
  int i;
  for (i=3; (i*i)<x; i+=2) {
    if ((x % i) == 0) {
      return 0;
    }
  }
  return 1;
}

int main(int argc, char *argv[]) {

  int x;
  printf("Enter a number: ");
  scanf("%d", &x);
  printf("%d is prime: %d\n", x, isPrime(x));

  return 0;
}

