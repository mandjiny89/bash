#!/bin/bash
# This code will get input from user and then diplay the information

echo "Enter your First Name:"
read FIRSTNAME

echo "Enter your Last Name:"
read LASTNAME

echo " Enter your age:"
read AGE

echo "This your full name: $FIRSTNAME $LASTNAME"
echo "This your age:$AGE"

echo "In 10 Years you will be: `expr $AGE + 18`"


