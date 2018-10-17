// ex3-14.c
int i;          // 4Bytes
short int s;    // 2Bytes

int main()
{
    i = 70000;  // 7000 -> 0x00011170
    s = i;      // 0x1170 -> 4464

    return 0;
}
