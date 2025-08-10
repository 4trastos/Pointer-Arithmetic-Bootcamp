#include <stdio.h>

typedef struct s_point {
    int x;
    int y;
} t_point;

void modify_point(t_point *p) {
    p->x = 10;
    p->y = 20;
}

int main(void) {
    t_point pt = {0, 0};
    modify_point(&pt);
    printf("x=%d y=%d\n", pt.x, pt.y);
    return 0;
}
