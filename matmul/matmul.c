//Some modifications made by Arun to silence warnings and such
//LLVM version, so no QED should appear in the C code.
//Adapted from 'hand'-coded version, which had different code...

#include "stdlib.h"
#include "stdio.h"

#define ELEMENT(m,c,r,s) *(m + c*s + r)
#define SIZE 100

int  rand1 (int lim);
void init  (unsigned long int * a, unsigned long int * b, unsigned long int * c, unsigned long int size);
void mmult (unsigned long int * a, unsigned long int * b, unsigned long int * c, unsigned long int size);
void print (unsigned long int * a, unsigned long int * b, unsigned long int * c, unsigned long int size, FILE * fp);

int rand1(int lim)
{
  static long a = 100001;
  a = (a * 125) % 2796203;
  return ((a % lim) + 1);
}

void init (unsigned long int * a,
              unsigned long int * b,
              unsigned long int * c,
              unsigned long int size)
{
  unsigned long int i, j;

  unsigned long int temp;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {
          temp = rand1(10000);
          *(a + i*size + j) = temp;
          temp = rand1(10000);
          *(b + i*size + j) = temp;
          *(c + i*size + j) = 0;
        }
    }
}

void mmult(unsigned long int * a,
               unsigned long int * b,
               unsigned long int * c,
               unsigned long int size)
{
  unsigned long int i, j, k;
  unsigned long int ai, bi, ci;
  unsigned long int o;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {
          for (k = 0; k < size; k++)
            {
              ai = k;
              ai += (i*size);
              bi = j;
              bi += k*size;
              ci = j;
              ci += i*size;
              o = a[ai]   * b[bi];

              c[ci]   += o;
            }
        }
    }
}
void print(unsigned long int * a,
               unsigned long int * b,
               unsigned long int * c,
               unsigned long int size,
               FILE* fp)
{
  unsigned long int i, j;
  unsigned long int ai, bi, ci;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {

          ai = *(a + i*size + j);
          printf( "%lu ", ai);
        }

      printf( "  ");

      for (j = 0; j < size; j++)
        {
          bi = *(b + i*size + j);
          printf( "%lu ", bi);
        }
      printf( "  ");

      for (j = 0; j < size; j++)
        {
          ci = *(c + i*size + j);
          printf( "%lu ", ci);
        }
      printf( "\n");
    }
}

//int main(unsigned long GUEST_MEM_BASE, unsigned long GUEST_MEM_SIZE)
int main()
{
  unsigned long int a[SIZE*SIZE];
  unsigned long int b[SIZE*SIZE];
  unsigned long int c[SIZE*SIZE];
//  unsigned long int ap[SIZE*SIZE];
//  unsigned long int bp[SIZE*SIZE];
//  unsigned long int cp[SIZE*SIZE];

  FILE* fp = fopen("out", "w");

  printf("Init\n");
  init(a, b, c, SIZE);
  //initQED(a, b, c, ap, bp, cp, SIZE);

  printf("Multiply\n");
  mmult(a, b, c, SIZE);
  //mmultQED(a, b, c, ap, bp, cp, SIZE);

  print(a, b, c, SIZE, fp);
  //printQED(a, b, c, ap, bp, cp, SIZE, fp);
  fclose(fp);

  printf("Complete\n");

  return 0;
}

