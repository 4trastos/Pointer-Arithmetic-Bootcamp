#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_10.out ./ejercicios/ejercicio_10.c

output=$(./ejercicios/ejercicio_10.out)
if [ "$output" = "Invierno" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Invierno)"
    exit 1
fi
