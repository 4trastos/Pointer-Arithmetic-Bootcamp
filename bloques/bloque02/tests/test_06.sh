#!/bin/bash
set -e
"./ejercicios/ejercicio_06.out"
output=$(./ejercicios/ejercicio_06.out)
if [ "$output" = "4" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 4)"
    exit 1
fi
