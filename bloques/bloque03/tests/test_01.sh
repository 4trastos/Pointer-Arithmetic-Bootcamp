#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_01.out ./ejercicios/ejercicio_01.c

output=$(./ejercicios/ejercicio_01.out)
if [ "$output" = "Mayor que 5" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Mayor que 5)"
    exit 1
fi
