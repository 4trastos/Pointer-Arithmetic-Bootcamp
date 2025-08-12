#!/bin/bash
gcc -Wall -Wextra -Werror ejercicios/ejercicio_04.c -o ejercicios/ejercicio_04.out
output=$(./ejercicios/ejercicio_04.out)
if [[ "$output" == "123" ]]; then
    echo "OK"
else
    echo "Fallo: esperado '123', obtenido '$output'"
    exit 1
fi
