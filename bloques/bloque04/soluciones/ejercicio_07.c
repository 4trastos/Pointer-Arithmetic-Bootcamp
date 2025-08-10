#include <stdio.h>

typedef struct s_point {
    int x;
    int y;
} t_point;

void print_points(t_point *arr, int size) {
    for (int i = 0; i < size; i++) {
        printf("(%d,%d)\n", (arr+i)->x, (arr+i)->y);
    }
}

int main(void) {
    t_point points[2] = {{7,8},{9,10}};
    print_points(points, 2);
    return 0;
}
