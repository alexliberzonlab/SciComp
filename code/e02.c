// compile with: gcc -o e02 e02.c

#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[]) {

  float g, v0, theta, x, y0, y;
  printf("enter a value for g: ");
  scanf("%f", &g);
  printf("enter a value for v0: ");
  scanf("%f", &v0);
  printf("enter a value for theta: ");
  scanf("%f", &theta);
  printf("enter a value for x: ");
  scanf("%f", &x);
  printf("enter a value for y0: ");
  scanf("%f", &y0);

  y = (x * tan(theta)) - (1.0/(2.0*(v0*v0)) * ((g*(x*x))/(cos(theta)*cos(theta)))) + y0;
  
  printf("The vertical height of the ball is: %.2f\n", y);

  return 0;
}

