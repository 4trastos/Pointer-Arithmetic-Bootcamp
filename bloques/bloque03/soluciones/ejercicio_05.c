#include <stdio.h>

int main(void) {
    char letra = 'z';
    switch(letra) {
        case 'a':
        case 'e':
        case 'i':
        case 'o':
        case 'u':
            printf("Vocal\n");
            break;
        default:
            printf("Consonante\n");
    }
    return 0;
}
