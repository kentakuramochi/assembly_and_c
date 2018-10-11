#include <stdio.h>

void intadd(int a, int b, int *c)
{
    *c = a + b;
}

void main()
{
    int a, b, c;
    printf("Enter a,b : ");
    scanf("%d %d", &a, &b);
    intadd(a, b, &c);
    printf("Answer = %d\n", c);
}
