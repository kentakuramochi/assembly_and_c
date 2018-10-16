#include <stdio.h>

#define NDIM 5

// row length is fixed
extern void setelement(int ndim, int arr[][NDIM], int row, int col);

int main()
{
    int a[NDIM][NDIM], i, j;

    setelement(NDIM, a, 2, 3);

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 3; j++) {
            printf("%3d", a[i][j]);
        }
        printf("\n");
    }

    return 0;
}
