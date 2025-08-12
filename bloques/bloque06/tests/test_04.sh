#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(echo "Hola" | ./prog)
[[ "$output" == "Hola" ]] && exit 0 || exit 1
