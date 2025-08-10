#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio03.c -o ./ejercicios/ejercicio03
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio03 | tr -d ' \n')
EXPECTED="(2,3)(4,5)(6,7)"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 03 correcto"
    exit 0
else
    echo "❌ Test 03 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
