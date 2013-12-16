// compile with: gcc -o e04 e04.c

#include <stdio.h>

int main(int argc, char *argv[]) {

  int sum = 0;
  int i;
  for (i=1; i<=10; i++) {
    sum = sum + i;
  }
  printf("the sum of the first 10 positive integers is: %d\n", sum);

  return 0;
}

