// list1.c
#include <stdio.h>
#include <string.h>
#include "phone.h"

struct person head, x, y, z;

int main()
{
    strcpy(head.name, "Alice");
    strcpy(head.phone, "0001112234");
    head.next  = &x;

    strcpy(x.name, "Bob");
    strcpy(x.phone, "0002223456");
    x.next  = &y;

    strcpy(y.name, "Charie");
    strcpy(y.phone, "0003334567");
    y.next  = &z;

    strcpy(z.name, "Dick");
    strcpy(z.phone, "0004445678");
    z.next  = NULL;                     // last element

    struct person *p = &head;

    while (1) {
        printf("%s : %s\n", p->name, p->phone);

        if (p->next == NULL) {
            break;
        }

        p = p->next;
    }

    return 0;
}
