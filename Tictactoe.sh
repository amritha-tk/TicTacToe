#!/bin/bash

echo "WELCOME"
resetBoard(){
  echo "====================="
  Arr=(. . . . . . . . .)
  echo "====================="
  echo "Game started"
}

toss(){
  player=$((RANDOM%2))
  if [ $player -eq '1' ]
    then
      echo "Player 1's Turn and "SYM=O
    else
      echo "Player 2's Turn and "SYM=X
  fi
}
toss

viewBoard(){
  echo "r\c 0 1 2"
  echo "0   ${Arr[0]} ${Arr[1]} ${Arr[2]}"
  echo "1   ${Arr[3]} ${Arr[4]} ${Arr[5]}"
  echo "2   ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}
viewBoard

