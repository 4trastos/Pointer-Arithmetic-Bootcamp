#include <stdio.h>
#include <stdlib.h>

int main(void) {
    int *arr = malloc(3 * sizeof(int));
    if (!arr) return 1;
    arr[0] = 7; arr[1] = 8; arr[2] = 9;
    int *p = arr;
    int **pp = &p;
    for (int i = 0; i < 3; i++) {
        printf("%d%c", (*pp)[i], i == 2 ? '\n' : ' ');
    }
    free(arr);
    return 0;
}
