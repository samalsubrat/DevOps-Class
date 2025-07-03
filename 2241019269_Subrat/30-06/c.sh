#!/bin/bash
echo 'Enter first number'
read a
echo 'Enter second number'
read b
sum=$(expr $a + $b)
sub=$(expr $a - $b)
mul=$(expr $a \* $b)
echo "$sum, $sub, $mul"
