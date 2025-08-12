#!/bin/bash
set -e
"./ejercicios/ejercicio_02.out"
output=$(./ejercicios/ejercicio_02.out)
if [ "$output" = "12345" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 12345)"
    exit 1
fi
