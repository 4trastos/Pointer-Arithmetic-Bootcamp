#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
output=$(echo -e "5\n7" | ./prog)
[[ "$output" == "Suma: 12" ]] && exit 0 || exit 1
