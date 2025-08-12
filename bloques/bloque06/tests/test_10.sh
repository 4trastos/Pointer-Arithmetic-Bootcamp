#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(./prog)
expected=$'10\n20\n30'
[[ "$output" == "$expected" ]] && exit 0 || exit 1
