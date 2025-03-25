#include <unistd.h>
void    ft_putchar(char c)
{

	write(1, &c, 1);
	write(1, "\n",1);
}
void	identity(char *str)	
{
	write (1, str, 5);
}
int	main(void)
{
	ft_putchar('E');
	identity("trans");
	return (0);
}

