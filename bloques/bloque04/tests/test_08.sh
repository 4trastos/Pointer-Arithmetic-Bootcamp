#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio08.c -o ./ejercicios/ejercicio08
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio08 | tr -d ' \n')

EXPECTED="1Bob(11,22)"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 08 correcto"
    exit 0
else
    echo "❌ Test 08 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
