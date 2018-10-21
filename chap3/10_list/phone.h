// phone.h
struct person
{
    char name[80];
    char phone[24];
    struct person *next; // next struct
};
