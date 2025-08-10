#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_06.out ./ejercicios/ejercicio_06.c

output=$(./ejercicios/ejercicio_06.out)
if [ "$output" = "b es mayor" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: b es mayor)"
    exit 1
fi
