#include <stdio.h>
#include <stdlib.h>

typedef struct s_node {
    int value;
    struct s_node *next;
} t_node;

void add_front(t_node **head) {
    t_node *new_node = malloc(sizeof(t_node));
    if (!new_node) return;
    new_node->value = 42;
    new_node->next = *head;
    *head = new_node;
}

void print_list(t_node *head) {
    while (head) {
        printf("%d ", head->value);
        head = head->next;
    }
    printf("\n");
}

int main(void) {
    t_node *head = NULL;
    add_front(&head);
    print_list(head);
    // Free memory (not mandatory here)
    while (head) {
        t_node *tmp = head;
        head = head->next;
        free(tmp);
    }
    return 0;
}
