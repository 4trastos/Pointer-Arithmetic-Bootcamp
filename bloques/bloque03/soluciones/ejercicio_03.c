#include <stdio.h>

int main(void) {
    int num = -2;
    if (num > 0) {
        printf("Positivo\n");
    } else if (num < 0) {
        printf("Negativo\n");
    } else {
        printf("Cero\n");
    }
    return 0;
}
