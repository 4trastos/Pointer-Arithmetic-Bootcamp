#include <stdio.h>
#include <assert.h>

void set_to_100(int *ptr);

int main() {
    int a = 5;
    set_to_100(&a);
    assert(a == 100);
    printf("Test ejercicio 02 OK\n");
    return 0;
}
