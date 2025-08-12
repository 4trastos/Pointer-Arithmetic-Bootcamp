#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_07.c -o ejercicios/ejercicio_07.out
output=$(./ejercicios/ejercicio_07.out)
if [[ "$output" == $'uno\ndos\ntres' ]]; then
    echo "OK"
else
    echo "Fallo: salida incorrecta"
    exit 1
fi
