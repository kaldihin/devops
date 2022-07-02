#!/bin/bash

array=(3 6 12 2323 -45 23 3066 3 1 0 -5 -4)
sum=0
pos_sum=0

for element in "${array[@]}"
do
  if (( element < 0 ))
  then
    ((sum+=1))
  else ((pos_sum+=1))
  fi
done

echo ""
echo "There is $sum negative numbers in the array"
echo ""
echo "There is $pos_sum positive numbers in the array"
echo ""
