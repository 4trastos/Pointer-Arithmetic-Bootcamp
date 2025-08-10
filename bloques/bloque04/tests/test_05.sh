#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio05.c -o ./ejercicios/ejercicio05
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio05 | tr -d ' \n')

EXPECTED="42"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 05 correcto"
    exit 0
else
    echo "❌ Test 05 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
