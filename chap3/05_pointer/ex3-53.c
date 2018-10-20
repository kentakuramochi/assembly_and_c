// ex3-53.c
char *p;
char s[] = "abcde";

int main()
{
    p = s;

    while (*p != '\0') {
        *p = *p - 'a' + 'A';
        p++;
    }

    return 0;
}
