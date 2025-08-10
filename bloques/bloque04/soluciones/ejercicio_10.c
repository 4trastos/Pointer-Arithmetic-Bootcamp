#include <stdio.h>

typedef struct s_config {
    int mode;
    char name[20];
} t_config;

void print_config(const t_config *cfg) {
    printf("Mode:%d Name:%s\n", cfg->mode, cfg->name);
}

int main(void) {
    t_config cfg = {2, "ConfigA"};
    print_config(&cfg);
    return 0;
}
