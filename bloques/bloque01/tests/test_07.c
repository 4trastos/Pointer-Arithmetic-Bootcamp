#include <assert.h>

void set_value_with_const_pointer(void);

int global_var = 0;

int main() {
    set_value_with_const_pointer();
    assert(global_var == 99);
    return 0;
}
