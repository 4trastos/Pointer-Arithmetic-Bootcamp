#!/bin/bash

gcc -Wall -Wextra -Werror ./ejercicios/ejercicio06.c -o ./ejercicios/ejercicio06
if [ $? -ne 0 ]; then
    echo "❌ Compilación fallida"
    exit 1
fi

OUTPUT=$(./ejercicios/ejercicio06 | tr -d ' \n')

EXPECTED="Updatedinfo"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
    echo "✅ Test 06 correcto"
    exit 0
else
    echo "❌ Test 06 incorrecto. Se esperaba '$EXPECTED', se obtuvo '$OUTPUT'"
    exit 1
fi
