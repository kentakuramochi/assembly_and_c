// ex3-23.c
#include <stdio.h>

int deposit;

int main()
{
    scanf("%d", &deposit);

    if (deposit > 0) {
        printf("Your deposit: %dyen\n", deposit);
    } else {
        printf("No deposit\n");
    }

    return 0;
}
