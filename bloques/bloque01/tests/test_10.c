#include <assert.h>
#include <stddef.h>

size_t pointer_size(void);

int main() {
    size_t s = pointer_size();
    assert(s == sizeof(int*));
    return 0;
}
