#!/bin/bash

expr 2 + 2

echo "this is the exit status of above line: $?"

rm raf.sh

echo "this is the exit status of above line: $?"

expr 2 \* 2
echo "this is the exit status of above line: $?"
