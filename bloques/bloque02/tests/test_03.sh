#!/bin/bash
set -e
"./ejercicios/ejercicio_03.out"
output=$(./ejercicios/ejercicio_03.out)
if [ "$output" = "25" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 25)"
    exit 1
fi
