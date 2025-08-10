#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_07.out ./ejercicios/ejercicio_07.c

output=$(./ejercicios/ejercicio_07.out)
if [ "$output" = "En rango" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: En rango)"
    exit 1
fi
