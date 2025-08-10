#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_09.out ./ejercicios/ejercicio_09.c

output=$(./ejercicios/ejercicio_09.out)
if [ "$output" = "Número positivo e impar" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Número positivo e impar)"
    exit 1
fi
