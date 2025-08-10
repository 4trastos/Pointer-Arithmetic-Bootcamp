#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_03.out ./ejercicios/ejercicio_03.c

output=$(./ejercicios/ejercicio_03.out)
if [ "$output" = "Negativo" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Negativo)"
    exit 1
fi
