#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
input="Juan\n30"
output=$(echo -e "$input" | ./prog)
expected="Nombre: Juan, Edad: 30"
[[ "$output" == "$expected" ]] && exit 0 || exit 1
