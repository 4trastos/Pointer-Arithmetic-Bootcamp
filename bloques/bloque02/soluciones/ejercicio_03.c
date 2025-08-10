#include <stdio.h>

int main(void) {
    int arr[5] = {5,10,15,20,25};
    int *p = arr;
    int *last = p + 4; /* ó (p + (sizeof(arr)/sizeof(arr[0]) - 1)) */
    printf("%d\n", *last);
    return 0;
}
