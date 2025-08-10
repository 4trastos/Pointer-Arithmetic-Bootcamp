#include <stdio.h>

int main(void) {
    int arr[3] = {100,200,300};
    int *p = arr;
    int a = *(p++); /* toma arr[0], luego p apunta a arr[1] */
    int b = *p++;   /* toma arr[1], luego p apunta a arr[2] */
    printf("%d %d\n", a, b);
    return 0;
}
