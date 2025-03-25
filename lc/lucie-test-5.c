#include <unistd.h>
void ft_is_negative(int n)
{
  if (n < 0)
  {
    write (1, "N", 1);
  }
  if (n == 0)
  {
    write (1, "tranny!", 7);
  }
  else
  {
    write (1, "P", 1);
  }
}

int main(void)
{
  ft_is_negative(0);
  return(0);
}
