#include <stdio.h>
#include <stdlib.h>

int main() {
    int *ptr = malloc(sizeof(int));
    if (!ptr) {
        printf("Error al reservar memoria\n");
        return 1;
    }
    *ptr = 42;
    printf("Valor: %d\n", *ptr);
    printf("Dirección: %p\n", (void*)ptr);
    free(ptr);
    return 0;
}
