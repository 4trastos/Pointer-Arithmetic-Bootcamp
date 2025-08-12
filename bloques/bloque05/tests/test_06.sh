#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_06.c -o ejercicios/ejercicio_06.out
output=$(./ejercicios/ejercicio_06.out)
if [[ "$output" == "55" ]]; then
    echo "OK"
else
    echo "Fallo: esperado '55', obtenido '$output'"
    exit 1
fi
