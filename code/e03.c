// compile with: gcc -o e03 e03.c

#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[]) {

  float Msmall = 47.0;
  float Mbig = 67.0;
  float rho = 1.038;
  float c = 3.7;
  float K = 0.0054;
  float Tw = 100.0;
  float Ty = 70.0;

  printf("Is the egg large (1) or small (0)? ");
  int whichEgg;
  scanf("%d", &whichEgg);

  float M;
  if (whichEgg == 0) {
	M = Msmall;
  }
  else {
	M = Mbig;
  }

  printf("enter the initial temperature of the egg\n");
  printf("reminder 4.0 for fridge, 20.0 for room: ");
  float To;
  scanf("%f", &To);

  float pi = 3.14159;
  float t = (((pow(M,(2.0/3.0)))*c*(pow(rho,(1.0/3.0))))/(K*(pi*pi)*(pow((4.0*pi/3.0),(2.0/3.0))))) * log(0.76 * ((To-Tw)/(Ty-Tw)));

  printf("time taken to cook the egg is: %.2f seconds (%d minutes, %d seconds)\n", t, (int) (t/60), (int)t%60);

  return 0;
}

