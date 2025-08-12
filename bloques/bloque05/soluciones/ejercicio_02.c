#include <stdio.h>
int main(void) {
    int x = 10;
    int *p1 = &x;
    int **p2 = &p1;
    **p2 = 99;
    printf("%d\n", x);
    return 0;
}
