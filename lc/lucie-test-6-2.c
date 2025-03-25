#include <unistd.h>
#include <stdio.h>

void ft_print_comb(void)
{
    char h;
    char r;
    char t;
    char e;
    h = '0';
    r = '1';
    t = '1';
    e = h * 100 + r * 10 + t;
    while (e < "789")
    {
        t++;




        if (h == 0)
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
