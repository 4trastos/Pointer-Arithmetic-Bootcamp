#include <assert.h>

int is_null(int *ptr);

int main() {
    int a;
    assert(is_null(NULL) == 1);
    assert(is_null(&a) == 0);
    return 0;
}
