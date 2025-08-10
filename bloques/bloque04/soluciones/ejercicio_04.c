#include <stdio.h>

typedef struct s_point {
    int x;
    int y;
} t_point;

typedef struct s_rect {
    t_point top_left;
    t_point bottom_right;
} t_rect;

int area(t_rect *r) {
    int width = r->bottom_right.x - r->top_left.x;
    int height = r->bottom_right.y - r->top_left.y;
    if (width < 0) width = -width;
    if (height < 0) height = -height;
    return width * height;
}

int main(void) {
    t_rect rect = {{1,1},{4,5}};
    printf("%d\n", area(&rect));
    return 0;
}
