// ex3-52.c
int x;
int *p;
int **q;

int main()
{
    p = &x;
    q = &p;

    **q = 5;

    return 0;
}
