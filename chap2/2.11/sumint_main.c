#include <stdio.h>

extern int sumint(int n, int *x);

int main()
{
    int x[] = { 1, 2, 3, 4, 5,
                6, 7, 8, 9, 10 };

    printf("sum = %d\n", sumint(10, x));

    return 0;
}

