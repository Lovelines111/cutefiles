#include <unistd.h>
#include <stdio.h>

void ft_print_comb(void)
{
  int h;
  int r;
  int t;
  int e;
  h = 0;
  r = 0;
  t = 0;
  e = h * 100 + r * 10 + t;
  while (e < 789)
  {
    t++;
    e = h * 100 + r * 10 + t;

    if (h == r)
    {
      if (r >= 10)
      {
        r = 0;
        h++;
        e = h * 100 + r * 10 + t;
      }
      else
      {
        r++;
        e = h * 100 + r * 10 + t;
      }
    } 


    if (r == t)  //034
    {
      t++;
      e = h * 100 + r * 10 + t;
    }
    if (t >= 10)
    {
      t = 0;
      r++;
      if (r >= 10)
      {
        r = 0;
        h++;
        e = h * 100 + r * 10 + t;
      }
      else
      {
        e = h * 100 + r * 10 + t;
      }
    }

    if (t == h)
    {
      t++;
      e = h * 100 + r * 10 + t;
    }
    if (t >= 10)
    {



      if (h == 0)
      {
        printf ("0%d ", e);
      }
      else
      {
        printf ("%d ", e);
      }
  }
}


int main(void)
{
  ft_print_comb();
  return(0);
}
