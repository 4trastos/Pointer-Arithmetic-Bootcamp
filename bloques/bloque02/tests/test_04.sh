#!/bin/bash
set -e
"./ejercicios/ejercicio_04.out"
output=$(./ejercicios/ejercicio_04.out)
if [ "$output" = "543210" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 543210)"
    exit 1
fi
