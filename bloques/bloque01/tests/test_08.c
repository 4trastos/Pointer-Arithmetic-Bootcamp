#include <assert.h>

int read_const_value(const int *ptr);

int main() {
    int value = 123;
    assert(read_const_value(&value) == 123);
    return 0;
}
