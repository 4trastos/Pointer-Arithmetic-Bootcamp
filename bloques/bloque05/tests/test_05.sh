#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_05.c -o ejercicios/ejercicio_05.out
output=$(./ejercicios/ejercicio_05.out)
if [[ "$output" == "7 8 9" ]]; then
    echo "OK"
else
    echo "Fallo: esperado '7 8 9', obtenido '$output'"
    exit 1
fi
