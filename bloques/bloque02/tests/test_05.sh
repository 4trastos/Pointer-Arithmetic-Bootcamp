#!/bin/bash
set -e
"./ejercicios/ejercicio_05.out"
output=$(./ejercicios/ejercicio_05.out)
if [ "$output" = "20" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 20)"
    exit 1
fi
