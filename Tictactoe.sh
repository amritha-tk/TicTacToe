#!/bin/bash

echo "WELCOME"
resetBoard(){
  echo "====================="
  Arr=(. . . . . . . . .)
  echo "====================="
  echo "Game started"
}
resetBoard

toss(){
 player=$((RANDOM%2))
  if [ $player -eq '1' ]
    then
      echo "I have won the toss and Starting the game "
	  read -p "What symbol do you choose 1.X  2.O" sym
    else
      echo "Computer won the game and starting the game"
	  sym=$((RANDOM%2+1))
  fi
}

choose(){
toss
if [ $sym -eq '1' ]
	then
		sym="X"
		echo "Chooses X"
	else
		sym="O"
		echo "Chooses O"
fi
}
choose

viewBoard(){
  echo "r\c 0 1 2"
  echo "0   ${Arr[0]} ${Arr[1]} ${Arr[2]}"
  echo "1   ${Arr[3]} ${Arr[4]} ${Arr[5]}"
  echo "2   ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}
viewBoard



