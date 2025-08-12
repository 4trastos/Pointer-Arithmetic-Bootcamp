#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_09.c -o ejercicios/ejercicio_09.out
output=$(./ejercicios/ejercicio_09.out)
if [[ "$output" == $'2\n1' ]]; then
    echo "OK"
else
    echo "Fallo: salida incorrecta"
    exit 1
fi
