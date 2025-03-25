#include <unistd.h>
#include <stdio.h>

void ft_print_comb(void)
{
    char h;
    char r;
    char t;
    char e;
    h = '1';
    r = '2';
    t = '3';
    e = (h r t);
    printf ("%d", e); //023
}
int main(void)
{
    ft_print_comb();
    return(0);
}
