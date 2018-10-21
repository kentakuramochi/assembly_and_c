// bsort.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// bubble sort
void bsort(int n, int x[])
{
    int i, k, tmp;

    for (i = n - 1; i >= 1; i--) {
        for (k = 0; k < i; k++) {
            if (x[k] > x[k + 1]) {
                tmp = x[k];
                x[k] = x[k + 1];
                x[k + 1] = tmp;
            }
        }
    }
}

int main()
{
    int x[100000], i, num;
    clock_t start, end;

    printf("Enter the number of data :");

    scanf(" %d", &num);

    for (i = 0; i < num; i++) {
        x [i] = rand() % 0x10000; // limit to 16bit length
    }

    start = clock();
    bsort(num, x);
    end = clock();

    /*for (i = 0; i < num; i++) {
        printf(" x[%d]=%5d\n", i, x[i]);
    }*/

    // time: 31.07 sec @ my environment
    printf("time: %.2f sec\n", (float)(end - start) / CLOCKS_PER_SEC);

    return 0;
}
