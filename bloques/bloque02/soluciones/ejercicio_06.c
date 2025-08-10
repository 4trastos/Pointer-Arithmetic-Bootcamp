#include <stdio.h>

int main(void) {
    int arr[7] = {10,20,30,40,50,60,70};
    int *p1 = &arr[1];
    int *p2 = &arr[5];
    ptrdiff_t diff = p2 - p1;
    printf("%td\n", diff);
    return 0;
}
