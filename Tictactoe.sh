#!/bin/bash

echo "WELCOME"
resetBoard(){
  echo "====================="
  Arr=(. . . . . . . . .)
  PLAYER=1
  GAME_STATUS=1
  echo "====================="
  echo "Game started"
}

toss(){
  player=$((RANDOM%2))
  if [ $player -eq '1' ]
    then
      echo "Player 1's Turn"
    else
      echo "Player 2's Turn"
  fi
}
toss
