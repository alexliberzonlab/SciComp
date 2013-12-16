// define a struct to store an array of ints
typedef struct {
  int n;
  int *array;
} int_array;

// free memory of an int_array
void int_array_destroy(int_array *ia);

// read cipher1.txt and put ints into an int_array
int_array *readCipherFile(char fname[]);

// decrypt int_array using 3-character string
int_array *XORdecrypt(int_array *cipherarray, char key[3]);

// convert int_array into a character string
char *int_array2string(int_array *ia);

// score an int_array on how "english" it is
// (lower values -> more "english")
double EnglishScore(int_array *b);
