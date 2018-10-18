// ex3-34.c
#include <stdio.h>

int main()
{
    int c;

    for (; ;) {
        c = getchar();

        if (c == EOF) {
            break;
        }

        putchar(c);
    }

    return 0;
}
