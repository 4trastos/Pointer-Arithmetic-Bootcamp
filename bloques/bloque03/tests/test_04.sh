#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_04.out ./ejercicios/ejercicio_04.c

output=$(./ejercicios/ejercicio_04.out)
if [ "$output" = "Martes" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Martes)"
    exit 1
fi
