#include <stdio.h>
#include <stdlib.h>

int main() {
    int **matriz = malloc(3 * sizeof(int*));
    if (!matriz) return 1;

    int valor = 1;
    for (int i = 0; i < 3; i++) {
        matriz[i] = malloc(3 * sizeof(int));
        if (!matriz[i]) return 1;
        for (int j = 0; j < 3; j++) {
            matriz[i][j] = valor++;
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    for (int i = 0; i < 3; i++) free(matriz[i]);
    free(matriz);
    return 0;
}
