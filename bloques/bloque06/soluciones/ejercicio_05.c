#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char palabra[100];
    printf("Introduce una palabra: ");
    if (scanf("%99s", palabra) != 1) return 1;

    char *dinamica = malloc(strlen(palabra) + 1);
    if (!dinamica) return 1;

    strcpy(dinamica, palabra);
    printf("Palabra: %s (longitud: %zu)\n", dinamica, strlen(dinamica));

    free(dinamica);
    return 0;
}
