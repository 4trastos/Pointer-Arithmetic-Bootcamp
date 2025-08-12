#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(echo "Mundo" | ./prog)
[[ "$output" == "Mundo" ]] && exit 0 || exit 1
