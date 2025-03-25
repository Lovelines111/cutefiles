#include <unistd.h>
#include <stdio.h>
void f1(void)
{
  int a;
  int b;
  int c;
  int e;
  a = 4;
  b = 5;
  c = 6;
  e = a * 100 + b * 10 + c;
  a++;
  e = a * 100 + b * 10 + c;
  write (1, &e, 3);
}

int main(void)
{
  f1();
  return(0);
}
