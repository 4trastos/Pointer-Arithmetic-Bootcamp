#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio04.c -o ./ejercicios/ejercicio04
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio04 | tr -d ' \n')

EXPECTED="12"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 04 correcto"
    exit 0
else
    echo "❌ Test 04 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
