#include <stdio.h>

int main(void) {
    int a = 10;
    int b = 20;
    if (a > b) {
        printf("a es mayor\n");
    } else if (b > a) {
        printf("b es mayor\n");
    } else {
        printf("Son iguales\n");
    }
    return 0;
}
