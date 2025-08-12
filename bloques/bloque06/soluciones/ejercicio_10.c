#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char nombre[50];
    int edad;
} Persona;

int main() {
    Persona original = {"Ana", 30};
    Persona *copia = malloc(sizeof(Persona));
    if (!copia) return 1;

    memcpy(copia, &original, sizeof(Persona));

    printf("Nombre: %s, Edad: %d\n", copia->nombre, copia->edad);
    free(copia);
    return 0;
}
