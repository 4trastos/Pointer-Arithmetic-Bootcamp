#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_03.c -o ejercicios/ejercicio_03.out
output=$(./ejercicios/ejercicio_03.out)
if [[ "$output" == "9 5" ]]; then
    echo "OK"
else
    echo "Fallo: esperado '9 5', obtenido '$output'"
    exit 1
fi
