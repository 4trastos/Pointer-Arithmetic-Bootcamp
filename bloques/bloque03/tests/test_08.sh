#!/bin/bash
set -e

gcc -Wall -Wextra -Werror -o ./ejercicios/ejercicio_08.out ./ejercicios/ejercicio_08.c

output=$(./ejercicios/ejercicio_08.out)
if [ "$output" = "Flag no está activo" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: Flag no está activo)"
    exit 1
fi
