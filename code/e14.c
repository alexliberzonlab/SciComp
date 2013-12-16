// compile with:
// gcc -o e14 e14.c `pkg-config --cflags --libs gsl`

#include <stdio.h>
#include <gsl/gsl_linalg.h>
#include <gsl/gsl_blas.h>

// a little function to take an array of doubles and return a gsl vector
//
gsl_vector *array2vec(double a[], int n) {
  gsl_vector *v = gsl_vector_alloc(n);
  int i;
  for (i=0; i<n; i++) {
    gsl_vector_set(v, i, a[i]);
  }
  return v;
}

int main(int argc, char *argv[]) {

  double income[] = {50000, 35000, 80000, 25000, 90000,
		     75000, 65000, 95000, 70000, 110000};
  double age[] = {35, 40, 45, 25, 70, 55, 50, 60, 45, 50};
  double education[] = {4, 2, 6, 0, 4, 6, 4, 6, 8, 8};
  double ones[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

  // stick data into gsl vectors
  gsl_vector *inc_v = array2vec(income, 10);
  gsl_vector *age_v = array2vec(age, 10);
  gsl_vector *edu_v = array2vec(education, 10);
  gsl_vector *one_v = array2vec(ones, 10);

  // create a gsl matrix X to hold [ones, age, education]
  gsl_matrix *X = gsl_matrix_alloc(10,3);
  // copy in the columns
  gsl_matrix_set_col(X, 0, one_v);
  gsl_matrix_set_col(X, 1, age_v);
  gsl_matrix_set_col(X, 2, edu_v);

  // allocate a gsl vector b to hold the beta weights
  gsl_vector *b = gsl_vector_alloc(3);

  // our equation is inc_v = X * b and we want to solve for b
  // we could use the OLS equation b = inv(X'X)X'Y but we won't
  // instead we will use QR decomposition, which turns out to be way more efficient
  // http://www.gnu.org/software/gsl/manual/html_node/QR-Decomposition.html
  gsl_vector *tau = gsl_vector_alloc(3);
  gsl_vector *resid = gsl_vector_alloc(10);
  gsl_linalg_QR_decomp(X, tau);
  gsl_linalg_QR_lssolve(X, tau, inc_v, b, resid);

  // print the results (the 3 coefficients b) to the screen
  printf("\nb = [\n");
  gsl_vector_fprintf(stdout, b, "%.3f");
  printf("]\n\n");

  // free the various heap memory that we allocated
  gsl_vector_free(resid);
  gsl_vector_free(tau);
  gsl_vector_free(b);
  gsl_matrix_free(X);
  gsl_vector_free(one_v);
  gsl_vector_free(edu_v);
  gsl_vector_free(age_v);
  gsl_vector_free(inc_v);

  return 0;
}
