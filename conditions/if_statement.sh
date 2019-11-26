#!/bin/bash

# Creating a if statement that can ask the user to guess the middle number if it's correct it will print the correct number else do nothing

echo "Yeah! it's time to guess a number between 1 to 5"
read three

if [ $three == 3 ]
then
  echo "Ofcourse you are smart"
fi
