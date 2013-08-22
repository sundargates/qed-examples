//Some modifications made by Arun to silence warnings and such

#include "stdlib.h"
#include "stdio.h"

#define ELEMENT(m,c,r,s) *(m + c*s + r)
#define CHECK(a, b) {\
	volatile unsigned long int *x, *y;\
	x = (volatile unsigned long int *) &a;\
	y = (volatile unsigned long int *) &b;\
	if( *x != *y) {\
		printf("EDDI Failed at line %d\n", __LINE__);\
		exit(1);\
	}\
}
/*inline void eddi_check_function(int line, unsigned long int a, unsigned long int b) {
	volatile unsigned long int *x, *y;
	x = (volatile unsigned long int *) &a;
	y = (volatile unsigned long int *) &b;
	if( *x != *y) {
		printf("EDDI Failed at line %d\n", line);
		exit(1);
	}
}
#define CHECK(a, b) eddi_check_function(__LINE__, a, b)
*/
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
int rand1QED(int lim)
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
  int i, j;//, k;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {
		  //Some of these are rewritten as if they were arrays, to the right
          *(a + i*size + j) = rand1(10000); // a[i][j] = rand1(10000)
          *(b + i*size + j) = rand1(10000); //etc.
          *(c + i*size + j) = 0;
        }
    }
}

void initQED (unsigned long int * a,
              unsigned long int * b,
              unsigned long int * c,
              unsigned long int * ap,
              unsigned long int * bp,
              unsigned long int * cp,
              unsigned long int size)
{
  unsigned long int i, j;
  unsigned long int ip, jp;

  unsigned long int temp;
  unsigned long int tempp;

  for (i = 0, ip=0; i < size; i++, ip++)
    {
      CHECK(i,ip);

      for (j = 0, jp=0; j < size; j++, jp++)
        {
          CHECK(j,jp);

          temp = rand1(10000);
          tempp = rand1QED(10000);
          CHECK(temp,tempp);

          *(a + i*size + j) = temp;
          *(ap + ip*size + jp) = tempp;
          CHECK(*(a + i*size + j), *(ap + ip*size + jp));

          temp = rand1(10000);
          tempp = rand1QED(10000);
          CHECK(temp,tempp);

          *(b + i*size + j) = temp;
          *(bp + ip*size + jp) = tempp;
          CHECK(*(b + i*size + j), *(bp + ip*size + jp));

          *(c + i*size + j) = 0;
          *(cp + ip*size + jp) = 0;
          CHECK(*(c + i*size + j), *(cp + ip*size + jp));
        }
      CHECK(j, jp);
    }
  CHECK(i, ip);
}

void mmult (unsigned long int * a,
            unsigned long int * b,
            unsigned long int * c,
            unsigned long int size)
{
  int i, j, k;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {
          for (k =0; k < size; k++)
            {
              *(c + i*size + j) += *(a + i*size + k) * *(b + k*size + j);
            }
        }
    }
}

void mmultQED (unsigned long int * a,
               unsigned long int * b,
               unsigned long int * c,
               unsigned long int * ap,
               unsigned long int * bp,
               unsigned long int * cp,
               unsigned long int size)
/*               unsigned long GMB,
               unsigned long GMS)*/
{
  unsigned long int i, j, k;
  unsigned long int ip, jp, kp;
  unsigned long int ai, bi, ci;
  unsigned long int api, bpi, cpi;
  unsigned long int o, p;

  for (i = 0, ip = 0; i < size; i++, ip++)
    {
      CHECK(i,ip);
      for (j = 0, jp = 0; j < size; j++, jp++)
        {
          CHECK(j, jp);
          for (k = 0, kp = 0; k < size; k++, kp++)
            {
              CHECK(k, kp);
              ai = k;
              api = kp;
              CHECK(ai, api);
              ai += (i*size);
              api += (ip*size);
              CHECK(ai, api);

              bi = j;
              bpi = jp;
              CHECK(bi, bpi);
              bi += k*size;
              bpi += kp*size;
              CHECK(bi, bpi);

              ci = j;
              cpi = jp;
              CHECK(ci, cpi);
              ci += i*size;
              cpi += ip*size;
              CHECK(ci, cpi);

              o = a[ai]   * b[bi];
              p = ap[api] * bp[bpi];
              CHECK(o, p);

              c[ci]   += o;
              cp[cpi] += p;
              CHECK (c[ci], cp[cpi]);
            }
          CHECK(k, kp);
        }
      CHECK(j, jp);
    }
  CHECK(i,ip);
}

void print (unsigned long int * a,
            unsigned long int * b,
            unsigned long int * c,
            unsigned long int size,
            FILE* fp)
{
  int i, j;

  for (i = 0; i < size; i++)
    {
      for (j = 0; j < size; j++)
        {
          printf( "%lu ", *(a + i*size + j));
        }

      printf( "  ");

      for (j = 0; j < size; j++)
        {
          printf( "%lu ", *(b + i*size + j));
        }

      printf( "  ");

      for (j = 0; j < size; j++)
        {
          printf( "%lu ", *(c + i*size + j));
        }
      printf( "\n");
    }
}

void printQED (unsigned long int * a,
               unsigned long int * b,
               unsigned long int * c,
               unsigned long int * ap,
               unsigned long int * bp,
               unsigned long int * cp,
               unsigned long int size,
               FILE* fp)
{
  unsigned long int i, j;
  unsigned long int ip, jp;
  unsigned long int ai, bi, ci;
  unsigned long int api, bpi, cpi;

  for (i = 0, ip=0; i < size; i++, ip++)
    {
      CHECK(i,ip);
      for (j = 0, jp=0; j < size; j++, jp++)
        {
          CHECK(j,jp);

          ai = *(a + i*size + j);
          api = *(ap + ip*size + jp);
          CHECK(ai,api);

          printf( "%lu ", ai);
        }
      CHECK(j, jp);

      printf( "  ");

      for (j = 0, jp=0; j < size; j++, jp++)
        {
          CHECK(j,jp);

          bi = *(b + i*size + j);
          bpi = *(bp + ip*size + jp);
          CHECK(bi,bpi);

          printf( "%lu ", bi);
        }
      CHECK(j, jp);

      printf( "  ");

      for (j = 0, jp=0; j < size; j++, jp++)
        {
          CHECK(j,jp);

          ci = *(c + i*size + j);
          cpi = *(cp + ip*size + jp);
          CHECK(ci,cpi); //here's where it has been failing

          printf( "%lu ", ci);
        }
      CHECK(j, jp);

      printf( "\n");
    }
}

//int main(unsigned long GUEST_MEM_BASE, unsigned long GUEST_MEM_SIZE)
int main()
{
  unsigned long int a[SIZE*SIZE];
  unsigned long int b[SIZE*SIZE];
  unsigned long int c[SIZE*SIZE];
  unsigned long int ap[SIZE*SIZE];
  unsigned long int bp[SIZE*SIZE];
  unsigned long int cp[SIZE*SIZE];

  FILE* fp = fopen("out", "w");

  printf("Init\n");
  //init(a, b, c, SIZE);
  initQED(a, b, c, ap, bp, cp, SIZE);

  printf("Multiply\n");
  //mmult(a, b, c, SIZE);
  mmultQED(a, b, c, ap, bp, cp, SIZE);

  //print(a, b, c, SIZE, fp);
  printQED(a, b, c, ap, bp, cp, SIZE, fp);
  fclose(fp);

  printf("Complete\n");

  return 0;
}

