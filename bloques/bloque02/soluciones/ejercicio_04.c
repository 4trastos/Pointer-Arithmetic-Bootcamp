#include <stdio.h>

int main(void) {
    int arr[6] = {0,1,2,3,4,5};
    int *p = arr + 5; /* apunta al último */
    for (int i = 0; i < 6; ++i) {
        printf("%d", *(p - i));
        if (i < 5) printf(" ");
    }
    printf("\n");
    return 0;
}
