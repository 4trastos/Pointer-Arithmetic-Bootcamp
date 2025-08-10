#include <stdio.h>

int main(void) {
    int n = 7;
    if (n > 0) {
        if (n % 2 == 0) {
            printf("Número positivo y par\n");
        } else {
            printf("Número positivo e impar\n");
        }
    } else {
        printf("Número no positivo\n");
    }
    return 0;
}
