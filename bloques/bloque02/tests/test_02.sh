#!/bin/bash
set -e
"./ejercicios/ejercicio_02.out"
output=$(./ejercicios/ejercicio_02.out)
if [ "$output" = "1 2 3 4 5" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 1 2 3 4 5)"
    exit 1
fi
