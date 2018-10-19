/* testas.c */
#include <stdio.h>

int main()
{
    static int x = 1, y;

    printf("Enter y:");
    scanf("%d", &y);

    printf("Add is %d\n", x + y);

    return 0;
}
