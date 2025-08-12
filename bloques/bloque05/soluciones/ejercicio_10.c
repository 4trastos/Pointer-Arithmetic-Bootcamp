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

void liberar(Nodo **lista) {
    while (*lista) {
        Nodo *tmp = *lista;
        *lista = (*lista)->sig;
        free(tmp);
    }
}

int main(void) {
    Nodo *lista = NULL;
    insertar_inicio(&lista, 10);
    insertar_inicio(&lista, 20);
    insertar_inicio(&lista, 30);
    liberar(&lista);
    if (lista == NULL)
        printf("OK\n");
    return 0;
}
