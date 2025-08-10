#include <assert.h>

void swap(int *a, int *b);

int main() {
    int x = 5, y = 10;
    swap(&x, &y);
    assert(x == 10 && y == 5);
    return 0;
}
