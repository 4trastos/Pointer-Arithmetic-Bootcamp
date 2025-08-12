#include <stdio.h>
#include <stdlib.h>

int *crear_array(int n) {
    int *arr = malloc(n * sizeof(int));
    if (!arr) return NULL;
    for (int i = 0; i < n; i++) arr[i] = i;
    return arr;
}

int main() {
    int n = 5;
    int *array = crear_array(n);
    if (!array) return 1;
    for (int i = 0; i < n; i++) printf("%d ", array[i]);
    printf("\n");
    free(array);
    return 0;
}
