#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_05.out ./ejercicios/ejercicio_05.c

output=$(./ejercicios/ejercicio_05.out)
if [ "$output" = "Consonante" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Consonante)"
    exit 1
fi
