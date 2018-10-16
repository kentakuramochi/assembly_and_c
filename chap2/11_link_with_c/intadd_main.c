#include <stdio.h>

extern void intadd(int a, int b, int *c);

int main()
{
    int a, b, c;

    printf("Enter a,b : ");
    scanf("%d %d", &a, &b);

    intadd(a, b, &c);
    printf("Answer = %d\n", c);

    return 0;
}
