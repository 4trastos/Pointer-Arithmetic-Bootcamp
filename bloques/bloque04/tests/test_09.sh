#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio09.c -o ./ejercicios/ejercicio09
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio09 | head -c 10)

EXPECTED="AAAAAAAAAA"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 09 correcto"
    exit 0
else
    echo "❌ Test 09 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
