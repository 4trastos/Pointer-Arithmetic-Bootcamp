#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_02.out ./ejercicios/ejercicio_02.c

output=$(./ejercicios/ejercicio_02.out)
if [ "$output" = "Impar" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Impar)"
    exit 1
fi
