#!/bin/bash
set -e
"./ejercicios/ejercicio_10.out"
output=$(./ejercicios/ejercicio_10.out)
if [ "$output" = "12" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 12)"
    exit 1
fi
