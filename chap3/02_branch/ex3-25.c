// ex3-25.c
#include <stdio.h>

#define HARE    1
#define KUMORI  2
#define AME     3
#define YUKI    4
#define TAIHU   5

int tenki;

int main()
{
    printf(" Tenki? ");

    scanf(" %d", &tenki);

    switch (tenki) {
        case HARE:
            puts(" hiking!");
            break;
        case KUMORI:
            puts(" movie!");
            break;
        case AME:
            puts(" drive!");
            break;
        case YUKI:
            puts(" ski!");
            break;
        case TAIHU:
            puts(" tv");
            break;
        default:
            puts(" sleep...");
            break;
    }

    return 0;
}
