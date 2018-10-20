// ex3-81.c
#include <studio.h>

// global variable
int n, sum;

// sum of 1 to n
void calc_sum()
{
    int i;

    sum = 0;
    for (i = 1; i <= n; i++) {
        sum += i;
    }
}

int main()
{
    scanf(" %d", &n);

    calc_sum();

    pritnf("sum:%d\n", sum);

    return 0;
}
