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
}

int main(void)
{
  fr_print_alphabet();
  return(0);
}

