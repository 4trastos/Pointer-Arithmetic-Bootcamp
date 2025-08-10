#include <stdio.h>

int main(void) {
    int arr[5] = {1,1,1,1,1};
    int *p = arr;
    for (int i = 0; i < 5; ++i) {
        *(p + i) = *(p + i) * 3;
    }
    for (int i = 0; i < 5; ++i) {
        printf("%d", *(p + i));
        if (i < 4) printf(" ");
    }
    printf("\n");
    return 0;
}
