#include <assert.h>

void increment(int *ptr);

int main() {
    int a = 41;
    increment(&a);
    assert(a == 42);
    return 0;
}
