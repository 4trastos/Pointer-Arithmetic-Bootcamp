#!/bin/bash
set -e
"./ejercicios/ejercicio_01.out"
output=$(./ejercicios/ejercicio_01.out)
if [ "$output" = "10" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 10)"
    exit 1
fi
