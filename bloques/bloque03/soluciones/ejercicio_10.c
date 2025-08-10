#include <stdio.h>

int main(void) {
    int mes = 12;
    switch(mes) {
        case 12: case 1: case 2:
            printf("Invierno\n");
            break;
        case 3: case 4: case 5:
            printf("Primavera\n");
            break;
        case 6: case 7: case 8:
            printf("Verano\n");
            break;
        case 9: case 10: case 11:
            printf("Otoño\n");
            break;
        default:
            printf("Mes inválido\n");
    }
    return 0;
}
