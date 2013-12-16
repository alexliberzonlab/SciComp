// compile with:
// gcc -o e16sol e16sol.c

#include <stdio.h>

void showvec(double v[], int rows) {
	int i,j;
	for (i=0; i<rows; i++) {
		printf("%f\n", v[i]);
	}
}

double meanvec(double v[], int rows) {
	int i;
	double m = 0.0;
	for (i=0; i<rows; i++) {
		m += v[i];
	}
	m = m / (double)rows;
	return m;
}

int main(int argc, char *argv[]) {
	FILE *fid = fopen("e16data.csv", "r");
	int rows = 10;
	double v1[rows], v2[rows];
	int i;
	for (i=0; i<rows; i++) {
		fscanf(fid, "%lf,%lf", &(v1[i]), &(v2[i]));
	}
	fclose(fid);
	showvec(v1, rows);
	showvec(v2, rows);
	double m1 = meanvec(v1, rows);
	double m2 = meanvec(v2, rows);
	printf("mean1 = %f\nmean2 = %f\n", m1, m2);
	return 0;
}