#include <stdio.h>

extern void lower2upper(int *n, char *string);

int main()
{
    char string[] = "aBlcD/+*Yz";
    int n;
    lower2upper(&n, string);
    printf("n = %d, string = %s\n", n, string);

    return 0;
}
