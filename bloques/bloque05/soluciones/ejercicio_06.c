#include <stdio.h>
#include <stdlib.h>

void asignar(int **pp) {
    *pp = malloc(sizeof(int));
    if (*pp) **pp = 55;
}

int main(void) {
    int *p = NULL;
    asignar(&p);
    printf("%d\n", *p);
    free(p);
    return 0;
}
