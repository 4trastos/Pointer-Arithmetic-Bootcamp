#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
input="2\n3\n1\n2\n3\n4\n5\n6"
output=$(echo -e "$input" | ./prog)
expected=$'1 2 3\n4 5 6'
[[ "$output" == "$expected" ]] && exit 0 || exit 1
