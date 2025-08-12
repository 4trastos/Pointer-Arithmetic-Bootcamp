#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    char **tabla = malloc(2 * sizeof(char *));
    if (!tabla) return 1;
    tabla[0] = strdup("hola");
    tabla[1] = strdup("mundo");
    char **pp = tabla;
    free(pp[1]);
    pp[1] = strdup("C");
    printf("%s\n%s\n", pp[0], pp[1]);
    free(tabla[0]);
    free(tabla[1]);
    free(tabla);
    return 0;
}
