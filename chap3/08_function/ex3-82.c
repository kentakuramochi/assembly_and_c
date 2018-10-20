// ex3-82.c
#include <studio.h>

// sum of 1 to n
int calc_sum(int n)
{
    int i, sum;

    sum = 0;
    for (i = 1; i <= n; i++) {
        sum += i;
    }

    return sum;
}

int main()
{
    // local variable
    int n, sum;

    scanf(" %d", &n);

    sum = calc_sum(n);

    pritnf("sum:%d\n", sum);

    return 0;
}
