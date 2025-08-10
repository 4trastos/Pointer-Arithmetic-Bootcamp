#include <stdio.h>

typedef struct s_point {
    int x;
    int y;
} t_point;

typedef struct s_employee {
    int id;
    char name[50];
    t_point location;
} t_employee;

void update_location(t_employee *e, int x, int y) {
    e->location.x = x;
    e->location.y = y;
}

int main(void) {
    t_employee emp = {1, "Bob", {0,0}};
    update_location(&emp, 11, 22);
    printf("%d %s (%d,%d)\n", emp.id, emp.name, emp.location.x, emp.location.y);
    return 0;
}
