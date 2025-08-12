#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_10.c -o ejercicios/ejercicio_10.out
output=$(./ejercicios/ejercicio_10.out)
if [[ "$output" == "OK" ]]; then
    echo "OK"
else
    echo "Fallo: salida incorrecta"
    exit 1
fi
