// compile with: gcc -o e09b1 e09b1.c

#include <stdio.h>

int fibR(int n) {
  if (n==1) {
    return 0;
  }
  else if (n==2) {
    return 1;
  }
  else {
    return fibR(n-2) + fibR(n-1);
  }
}

int main(int argc, char *argv[]) {

  int n;
  printf("Which Fibonacci number do you want? ");
  scanf("%d", &n);
  printf("Fibonacci number %d is equal to %d\n", n, fibR(n));

  return 0;
}
