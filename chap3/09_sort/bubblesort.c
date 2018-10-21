// bubblesort.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// bubble sort by x86 asm code
extern void bubblesort(int n, int x[]);

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
    bubblesort(num, x);
    end = clock();

    /*for (i = 0; i < num; i++) {
        printf(" x[%d]=%5d\n", i, x[i]);
    }*/

    // time: 16.34 sec @ my environment
    printf("time: %.2f sec\n", (float)(end - start) / CLOCKS_PER_SEC);

    return 0;
}
