#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(./prog)
[[ "$output" == "1 2 3 4 5" ]] && exit 0 || exit 1
