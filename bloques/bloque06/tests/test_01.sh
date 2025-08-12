#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(./prog)
[[ "$output" == "42" ]] && exit 0 || exit 1
