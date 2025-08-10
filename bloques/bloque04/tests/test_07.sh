#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio07.c -o ./ejercicios/ejercicio07
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio07 | tr -d ' \n')

EXPECTED="(7,8)(9,10)"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 07 correcto"
    exit 0
else
    echo "❌ Test 07 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
