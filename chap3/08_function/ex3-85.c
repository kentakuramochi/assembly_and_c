// ex3-85.c
void swap(int *p, int *q)
{
    int t;
    t = *p;
    *p = *q;
    *q = t;
}

int main()
{
    int x, y;

    x = 2;
    y = 3;

    swap(&x, &y);

    return 0;
}
