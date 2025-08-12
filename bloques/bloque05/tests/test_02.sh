#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_02.c -o ejercicios/ejercicio_02.out
output=$(./ejercicios/ejercicio_02.out)
if [[ "$output" == "99" ]]; then
    echo "OK"
else
    echo "Fallo: se esperaba '99', se obtuvo '$output'"
    exit 1
fi
