#!/bin/bash

function add_string()
{
firstString=${1:-"First"}
secondString=${2:-"Second"}

echo "Concatenation Of Two Strings is :- ${firstString}${secondString}"
}
add_string $1 $2
