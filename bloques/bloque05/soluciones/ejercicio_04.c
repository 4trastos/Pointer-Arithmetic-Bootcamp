#include <stdio.h>

void cambiar(int **p) {
    **p = 123;
}

int main(void) {
    int x = 0;
    int *px = &x;
    cambiar(&px);
    printf("%d\n", x);
    return 0;
}
