#include <assert.h>
#include <stdio.h>

int distance_between(int *p1, int *p2);

int main() {
    int arr[5];
    assert(distance_between(&arr[0], &arr[3]) == 3);
    assert(distance_between(&arr[3], &arr[0]) == -3);
    printf("Test ejercicio 04 OK\n");
    return 0;
}
