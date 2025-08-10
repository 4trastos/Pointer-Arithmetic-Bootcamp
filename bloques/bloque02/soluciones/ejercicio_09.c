#include <stdio.h>

int main(void) {
    int arr[5] = {7,14,21,28,35};
    int *p = arr;
    printf("%d\n", p[2]); /* equivalente a *(p + 2) */
    return 0;
}
