#include <stdio.h>

int main(void) {
    int arr[6] = {3,9,1,12,7,4};
    int *p = arr;
    int max = *p;
    for (int i = 1; i < 6; ++i) {
        if (*(p + i) > max) max = *(p + i);
    }
    printf("%d\n", max);
    return 0;
}
