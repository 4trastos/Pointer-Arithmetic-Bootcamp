#!/bin/bash

# Test Ejercicio 01 - Modificar valores de estructura con puntero

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio01.c -o ./ejercicios/ejercicio01
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

./ejercicios/ejercicio01 > output.txt

EXPECTED="x=10 y=20"
GOT=$(cat output.txt | tr -d '\r\n ')

if [[ "$GOT" == "$EXPECTED" ]]; then
    echo "✅ Test 01 correcto"
    exit 0
else
    echo "❌ Test 01 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$GOT'"
    exit 1
fi
