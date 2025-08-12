#include <stdio.h>
int main(void) {
    char *palabras[] = {"uno", "dos", "tres"};
    char **pp = palabras;
    for (int i = 0; i < 3; i++) {
        printf("%s\n", pp[i]);
    }
    return 0;
}
