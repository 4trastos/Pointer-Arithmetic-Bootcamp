#!/bin/bash

# Test Ejercicio 02 - Asignar campos nombre y edad

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio02.c -o ./ejercicios/ejercicio02
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

./ejercicios/ejercicio02 > output.txt

EXPECTED="Name:Alice Age:30"
GOT=$(cat output.txt | tr -d '\r\n ')

if [[ "$GOT" == "$EXPECTED" ]]; then
    echo "✅ Test 02 correcto"
    exit 0
else
    echo "❌ Test 02 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$GOT'"
    exit 1
fi
