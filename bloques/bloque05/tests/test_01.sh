#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_01.c -o ejercicios/ejercicio_01.out
output=$(./ejercicios/ejercicio_01.out)
if [[ "$output" == "42" ]]; then
    echo "OK"
else
    echo "Fallo: se esperaba '42', se obtuvo '$output'"
    exit 1
fi
