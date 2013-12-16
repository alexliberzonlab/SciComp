// compile with: gcc -o e06 e06.c

#include <stdio.h>

int main(int argc, char *argv[]) {

  int n;
  printf("enter n: ");
  scanf("%d", &n);
  int sum = 0;
  int i;
  for (i=1; i<=n; i++) {
    sum = sum + i;
  }
  printf("the sum of the first %d positive integers is: %d\n", n, sum);

  return 0;
}

