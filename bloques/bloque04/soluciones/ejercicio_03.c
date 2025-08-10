#include <stdio.h>

typedef struct s_point {
    int x;
    int y;
} t_point;

void increment_points(t_point *arr, int size) {
    for (int i = 0; i < size; i++) {
        (arr + i)->x += 1;
        (arr + i)->y += 1;
    }
}

int main(void) {
    t_point arr[3] = {{1,2},{3,4},{5,6}};
    increment_points(arr, 3);
    for (int i = 0; i < 3; i++)
        printf("(%d,%d) ", arr[i].x, arr[i].y);
    printf("\n");
    return 0;
}
