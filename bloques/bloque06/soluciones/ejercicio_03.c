#include <stdio.h>
#include <stdlib.h>

int main() {
    int *arr = calloc(5, sizeof(int));
    if (!arr) {
        printf("Error al reservar memoria\n");
        return 1;
    }
    for (int i = 0; i < 5; i++) printf("%d ", arr[i]);
    printf("\n");
    free(arr);
    return 0;
}
