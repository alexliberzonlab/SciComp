#ifndef M_PI
#define M_PI 3.1415926535897932384626433832795
#endif

struct myvec{
  double val;
  int ind;
};

void oneplate(double r1, double r2, double a1, double a2, double output[6]);
void platemethod(double a[], double r[], int n, double output[9]);
int mycomp(const void *a, const void *b);
double getangle(double x, double y);
int mycomp_struct(const void *a, const void *b);
void show_double_vec(double vec[], int n);
