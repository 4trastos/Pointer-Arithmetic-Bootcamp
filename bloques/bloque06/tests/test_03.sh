#!/bin/bash
gcc -Wall -Wextra -Werror main.c -o prog || exit 1
input="5\n1\n2\n3\n4\n5"
output=$(echo -e "$input" | ./prog)
expected="5 4 3 2 1"
[[ "$output" == "$expected" ]] && exit 0 || exit 1
