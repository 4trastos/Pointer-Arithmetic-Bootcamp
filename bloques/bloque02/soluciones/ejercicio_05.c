#include <stdio.h>

int main(void) {
    int arr[4] = {2,4,6,8};
    int *p = arr;
    int sum = 0;
    for (int i = 0; i < 4; ++i) {
        sum += *(p + i);
    }
    printf("%d\n", sum);
    return 0;
}
