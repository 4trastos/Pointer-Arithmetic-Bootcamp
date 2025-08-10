#include <stdio.h>
#include <string.h>

typedef struct s_info {
    char description[100];
} t_info;

typedef struct s_data {
    int num;
    t_info *info;
} t_data;

void update_info(t_data *d) {
    if (d && d->info)
        strcpy(d->info->description, "Updated info");
}

int main(void) {
    t_info info = {"Initial"};
    t_data data = {5, &info};
    update_info(&data);
    printf("%s\n", data.info->description);
    return 0;
}
