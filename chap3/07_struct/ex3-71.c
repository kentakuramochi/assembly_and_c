// ex3-71.c
struct idcard {
    char name[20]; // 20Byte
    int id;        // 4Byte
    char birth[9]; // 9Byte (+3Byte padding=12Byte)
    int age;       // 4Byte
};
// total: 37+3=40Byte

struct idcard x;

int main()
{
    x.name[0] = 'A';
    x.name[19] = '\0';
    x.id = 186;
    x.birth[0] = '1';
    x.birth[8] = '\0';
    x.age = 30;

    return 0;
}
