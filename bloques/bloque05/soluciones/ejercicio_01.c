#include <stdio.h>
int main(void) {
    int x = 42;
    int *p1 = &x;
    int **p2 = &p1;
    printf("%d\n", **p2);
    return 0;
}
