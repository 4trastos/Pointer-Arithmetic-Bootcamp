#!/bin/bash
set -e
"./ejercicios/ejercicio_09.out"
output=$(./ejercicios/ejercicio_09.out)
if [ "$output" = "21" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 21)"
    exit 1
fi
