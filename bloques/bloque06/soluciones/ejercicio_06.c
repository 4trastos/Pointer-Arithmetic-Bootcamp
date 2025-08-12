#include <stdio.h>
#include <stdlib.h>

int main() {
    float *arr = malloc(4 * sizeof(float));
    if (!arr) return 1;

    for (int i = 0; i < 4; i++) {
        arr[i] = i * 1.5f;
        printf("%.2f ", arr[i]);
    }
    printf("\n");

    free(arr);
    arr = NULL;
    return 0;
}
