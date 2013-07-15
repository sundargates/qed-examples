#include "stdlib.h"
#include "stdio.h"

int unsolvable(int x) {
  int i, y=x;

  for(i=0; i<y; i++) {
    x = x + 1;
  }

  return x;
}

int do_a(int x) {
  int i, y=x;
  
  for(i=0; i<y; i++) {
    x = x + 2;
  }

  return x;
}

int do_b(int x) {
  int i, y=x;

  for(i=0; i<y; i++) {
    x = x + 3;
  }
  return x;
}

int main() {
  int x = 0;
  x = unsolvable(x);

  if(x) {
    x = do_a(2);
    printf("0\n");
  }
  else {
    x = do_b(2);
    printf("1\n");
  }

  return x;
}
