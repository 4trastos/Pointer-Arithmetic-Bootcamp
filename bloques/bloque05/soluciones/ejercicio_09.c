#include <stdio.h>
#include <stdlib.h>

typedef struct Nodo {
    int valor;
    struct Nodo *sig;
} Nodo;

void insertar_inicio(Nodo **lista, int val) {
    Nodo *nuevo = malloc(sizeof(Nodo));
    nuevo->valor = val;
    nuevo->sig = *lista;
    *lista = nuevo;
}

int main(void) {
    Nodo *lista = NULL;
    insertar_inicio(&lista, 1);
    insertar_inicio(&lista, 2);
    for (Nodo *tmp = lista; tmp; tmp = tmp->sig) {
        printf("%d\n", tmp->valor);
    }
    while (lista) {
        Nodo *tmp = lista;
        lista = lista->sig;
        free(tmp);
    }
    return 0;
}
