#!/bin/bash

echo ""
echo "==========================================================================="
echo "==========================================================================="
echo "======BBBB==B==BBBB==BBBB==BBBB==BBBB==========L=====LLLL==LLLL==LLLL======"
echo "======B==B==B==B==B==B==B==B=====B==B==========L=====L=====L=====L========="
echo "======B==B==B==B=====B=====B=====B==B==========L=====L=====LLLL==LLLL======"
echo "======BBBB==B==B=====B=====BBBB==BBB===========L=====LLLL=====L=====L======"
echo "======B==B==B==B==B==B==B==B=====B=BB==========L=====L========L=====L======"
echo "======B==B==B==B==B==B==B==B=====B==B==========L=====L========L=====L======"
echo "======BBBB==B==BBBB==BBBB==BBBB==B==B==========LLLL==LLLL==LLLL==LLLL======"
echo "==========================================================================="
echo ""

game() {

rand=$(($RANDOM % 100))
counter=7

while (( $counter > 0 ))
do
  if [[ $counter -eq 1 ]]
  then
    echo ""
    echo "This is Your last attempt."
    echo ""
  fi

  read -p "Which number ? " result
  
  if [[ $result -ne $rand && $counter -eq 1 ]]
  then
    echo ""
    echo "=( =( =( =("
    echo "You lose."
    echo "=( =( =( =("
    echo ""
    break
  fi

  ((counter-=1))

  echo ""

  if [[ $result -lt $rand ]]
  then
    echo "It is bigger."
    echo ""
    continue
  elif [[ $result -gt $rand ]]
  then
    echo "It is less."
    echo ""
    continue
  elif [[ $result -eq $rand ]]
  then
    echo ""
    echo "================================"
    echo ""
    echo "You guess! It's really $result ."
    echo ""
    echo "================================"
    echo ""
    echo "You've needed $((7-counter)) attempts to guess. "
    echo ""
    break 
  fi
done
}

while (true)
do
  read -p "Do you want to play ? ( yes | no ): " answer
  if [[ $answer == 'yes' ]]
  then
    echo ""
    game
  elif [[ $answer == 'no' ]]
  then
    exit 0
  else
    echo "Incorrect input."
  fi
done
