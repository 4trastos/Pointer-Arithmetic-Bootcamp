#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_08.c -o ejercicios/ejercicio_08.out
output=$(./ejercicios/ejercicio_08.out)
if [[ "$output" == $'hola\nC' ]]; then
    echo "OK"
else
    echo "Fallo: salida incorrecta"
    exit 1
fi
