#!/bin/bash
set -e
"./ejercicios/ejercicio_07.out"
output=$(./ejercicios/ejercicio_07.out)
if [ "$output" = "100 200" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 100 200)"
    exit 1
fi
