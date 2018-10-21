// list2.c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "phone.h"

struct person head;

// create new element
struct person *newperson()
{
    return (struct person*)malloc(sizeof(struct person));
}

// insert element before a specific element
void insert(char *name, char *phone, struct person *pos)
{
    struct person *temp;

    temp = pos->next;
    pos->next = newperson();

    strcpy(pos->next->name, name);
    strcpy(pos->next->phone, phone);

    pos->next->next = temp;
}

// delete specific element
void delete(struct person *pos)
{
    struct person *p;

    p = pos->next;

    pos->next = pos->next->next;

    free(p);
}

// search element by name
struct person *locate(char *name, struct person *pos)
{
    while (pos->next != NULL) {
        if (!strcmp(pos->next->name, name)) {
            break;
        }

        pos = pos->next;
    }

    return pos;
}

// print all elements
void printlist()
{
    struct person *p = &head;

    while (p->next != NULL) {
        printf("%s : %s\n", p->next->name, p->next->phone);

        p = p->next;
    }
}

int main()
{
    struct person *p = &head;

    // create list with 3 elements: "Charie", "Bob", "Alice"
    insert("Alice", "0000-11-2222", &head);
    insert("Bob", "3333-44-5555", &head);
    insert("Charie", "6666-77-8888", &head);

    printf("#1\n");
    printlist();

    // delete "Charie" : "Bob", "Alice"
    p = locate("Charie", &head);
    delete(p);

    printf("#2\n");
    printlist();

    // insert "Dick": "Bob", "Dick", "Alice"
    p = locate("Alice", &head);
    insert("Dick", "9999-00-1111", p);

    printf("#3\n");
    printlist();

    return 0;
}
