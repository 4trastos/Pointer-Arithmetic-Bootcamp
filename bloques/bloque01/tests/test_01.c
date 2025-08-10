#include <stdio.h>

void print_address(int value);

int main() {
    printf("Ejecutando test ejercicio 01...\n");
    print_address(42); // salida debe mostrar una dirección de memoria
    printf(" ==>> Si ves una dirección de memoria (0x...) está correcto.\n");
    return 0;
}
