// ex3-61.c
#include <stdio.h>

// calorie table
//    |brkfast|lunch|dinner|supper|total
// mon|    400|  600|   800|   200|
// tue|      0|  500|   600|   100|
// ...
// sun|    400|  500|   700|   300|
// avg|

int cal[8][5];

int main()
{
    int i, j;
    int sum;

    // input
    for (i = 0; i < 7; i++) {
        for (j = 0; j < 4; j++) {
            printf("day=%d, meal=%d?", i, j);
            scanf("%d", &cal[i][j]);
        }
    }

    // calculate total calorie in a day
    for (i = 0; i < 7; i++) {
        sum = 0;
        for (j = 0; j < 4; j++) {
            sum += cal[i][j];
        }

        cal[i][4] = sum;
    }

    // calculate avg calorie of each meal
    for (j = 0; j < 4; j++) {
        sum = 0;
        for (i = 0; i < 7; i++) {
            sum += cal[i][j];
        }

        cal[7][i] = sum / 7;
    }

    // display
    for (i = 0; i < 8; i++) {
        for (j = 0; j < 5; j++) {
            printf("%4d ", cal[i][j]);
        }
        printf("\n");
    }

    return 0;
}
