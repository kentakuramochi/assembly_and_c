// ex3-36.c
#include <stdio.h>

int main()
{
    int i, j;

    for (i = 1; i <= 9; i++) {
        printf("%d: ", i);

        for (j = 1; j <=9; j++) {
            printf("%2d ", i * j);
        }

        printf("\n");
    }

    return 0;
}
