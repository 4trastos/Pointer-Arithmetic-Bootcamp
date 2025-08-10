#!/bin/bash
set -e
"./ejercicios/ejercicio_04.out"
output=$(./ejercicios/ejercicio_04.out)
if [ "$output" = "5 4 3 2 1 0" ]; then
    echo "OK"
    exit 0
else
    echo "FALLO: salida='$output' (esperado: 5 4 3 2 1 0)"
    exit 1
fi
