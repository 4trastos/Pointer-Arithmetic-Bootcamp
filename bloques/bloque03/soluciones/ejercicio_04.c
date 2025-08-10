#include <stdio.h>

int main(void) {
    int dia = 2;
    switch(dia) {
        case 1:
            printf("Lunes\n");
            break;
        case 2:
            printf("Martes\n");
            break;
        case 3:
            printf("Miércoles\n");
            break;
        default:
            printf("Día inválido\n");
    }
    return 0;
}
