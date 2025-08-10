#include <stdio.h>
#include <string.h>

typedef struct s_person {
    char name[50];
    int age;
} t_person;

void init_person(t_person *p) {
    strcpy(p->name, "Alice");
    p->age = 30;
}

int main(void) {
    t_person person;
    init_person(&person);
    printf("Name:%s Age:%d\n", person.name, person.age);
    return 0;
}
