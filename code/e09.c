// compile with: gcc -o e09 e09.c

#include <stdio.h>

int fib(int n) {
  if (n==1) {
    return 0;
  }
  else if (n==2) {
    return 1;
  }
  else {
    int fprev2 = 1;
    int fprev1 = 1;
    int fn = 1;
    int i = 3;
    while (i < n) {
      fn = fprev1 + fprev2;
      fprev2 = fprev1;
      fprev1 = fn;
      i = i + 1;
    }
    return fn;
  }
}

int main(int argc, char *argv[]) {

  int n;
  printf("Which Fibonacci number do you want? ");
  scanf("%d", &n);
  printf("Fibonacci number %d is equal to %d\n", n, fib(n));

  return 0;
}
