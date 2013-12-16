// compile with: gcc -o e01 e01.c

#include <stdio.h>

int main(int argc, char *argv[]) {

  printf("enter the temperature in Celsius: ");
  float tempc;
  scanf("%f", &tempc);
  float tempf = ((9.0/5.0) * tempc) + 32.0;
  printf("%.2f Celsius is %.2f degrees Fahrenheit\n", tempc, tempf);

  return 0;
}

