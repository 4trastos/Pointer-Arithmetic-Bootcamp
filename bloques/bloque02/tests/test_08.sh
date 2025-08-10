#!/bin/bash
set -e
"./ejercicios/ejercicio_08.out"
output=$(./ejercicios/ejercicio_08.out)
if [ "$output" = "3 3 3 3 3" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 3 3 3 3 3)"
    exit 1
fi
