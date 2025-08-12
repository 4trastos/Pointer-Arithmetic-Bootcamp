#include <stdio.h>
#include <stdlib.h>

int main() {
    size_t tam = (size_t)-1;
    void *ptr = malloc(tam);
    if (!ptr) {
        printf("Error de memoria\n");
        return 0;
    }
    free(ptr);
    return 0;
}
