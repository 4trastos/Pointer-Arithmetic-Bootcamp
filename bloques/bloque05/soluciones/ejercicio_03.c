#include <stdio.h>
int main(void) {
    int a = 5, b = 9;
    int *pa = &a, *pb = &b;
    int **ppa = &pa, **ppb = &pb;
    int temp = **ppa;
    **ppa = **ppb;
    **ppb = temp;
    printf("%d %d\n", a, b);
    return 0;
}
