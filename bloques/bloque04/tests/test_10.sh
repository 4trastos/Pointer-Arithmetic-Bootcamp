#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio10.c -o ./ejercicios/ejercicio10
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio10 | tr -d ' \n')

EXPECTED="Mode:2Name:ConfigA"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 10 correcto"
    exit 0
else
    echo "❌ Test 10 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
