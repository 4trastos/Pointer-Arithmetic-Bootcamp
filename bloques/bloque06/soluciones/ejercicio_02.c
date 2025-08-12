#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    printf("Introduce n: ");
    if (scanf("%d", &n) != 1 || n <= 0) return 1;

    int *arr = malloc(n * sizeof(int));
    if (!arr) {
        printf("Error al reservar memoria\n");
        return 1;
    }

    for (int i = 0; i < n; i++) arr[i] = i + 1;
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");

    free(arr);
    return 0;
}
