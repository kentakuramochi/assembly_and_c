// ex3-22.c
#include <stdio.h>

int deposit;

int main()
{
    deposit = 100;

    puts("Welcome to Touzai Bank!");

    if (deposit > 0) {
        printf("Your deposit: %dyen\n", deposit);
    }

    puts("May I help you?");

    return 0;
}
