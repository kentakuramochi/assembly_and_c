// ex3-54.c
int *p;
int s[] = { 1, 2, 3, 4, 0 };

int main()
{
    p = s;

    while (*p != 0) {
        *p = *p + 1;
        p++;
    }

    return 0;
}
