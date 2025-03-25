#include <unistd.h>
void fr_print_alphabet(void)
{
  char i;
  i = 'a';
  while(i <= 'z')
    {
    write (1, &i, 1 );
    i++;
    }
  write (1, "&", 1);
}
void ft_print_reverse_alphabet(void)
{
  write (1, "&", 1);
  char v;
  v = 'z';
  while(v >= 'a')
    {
      write (1, &v, 1);
      v--;
    }
}

int main(void)
{
  fr_print_alphabet();
  write (1, "\n", 1);
  ft_print_reverse_alphabet();
  return(0);
}

