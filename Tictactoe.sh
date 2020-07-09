#!/bin/bash

echo "WELCOME"
resetBoard(){
  echo "====================="
  Arr=(. . . . . . . . .)
  gamestatus=1
  echo "====================="
  echo "Game started"
}
#resetBoard

toss(){
 player=$((RANDOM%2+1))
  if [ $player -eq '1' ]
    then
      echo "I have won the toss and Starting the game "
	  read -p "What symbol do you choose 1.X  2.O" sym_num
    else
      echo "Computer won the game and starting the game"
	  sym_num=$((RANDOM%2+1))

  fi 

}

choose(){
toss
if [ $sym_num -eq '1' ]
	then
		sym="X"
		echo "Chooses X"
	else
		sym="O"
		echo "Chooses O"
fi

}


viewBoard(){
  echo "r\c 0 1 2"
  echo "0   ${Arr[0]} ${Arr[1]} ${Arr[2]}"
  echo "1   ${Arr[3]} ${Arr[4]} ${Arr[5]}"
  echo "2   ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}


checkmatch(){
  if [ ${Arr[$1]} != "." ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [ ${Arr[$2]} == ${Arr[$3]} ]; then
    gamestatus=0
  fi
}

checkgame(){
  checkmatch 0 1 2
  checkmatch 3 4 5
  checkmatch 6 7 8
  checkmatch 0 3 6
  checkmatch 1 4 7
  checkmatch 2 5 8
  checkmatch 0 4 8
  checkmatch 2 4 6
}

set(){
  idx=$(( $1 * 3 + $2 ))
  if [ ${Arr[$idx]} == "." ]; then
    Arr[$idx]=$3
    player=$((player%2+1))

    sym_num=$((sym_num%2+1))
    case  $sym_num in
    1)
      sym="X"
      ;;
    2)
      sym="O"
      ;;
    *)
      echo "Unknown symbol"
      ;;
    esac
     
    else
    echo "You can't place there!"
  fi
}

# Main program starts here

resetBoard
choose

 # infinite game loop
while [ 1 == 1 ]; do
  echo ""
  echo "Player $player's turn: ($sym)"

  viewBoard
  echo ""
  echo "  Command:"
  echo "        1. set [row] [column]"
  echo "        2. restart"
  
# For tic tac game logic
    while [ 1 == 1 ]; do
    read -r cmd a b
    if [ $cmd == "set" ]; then
        set $a $b $sym $sym_num
        break
    elif [ $cmd == "restart" ]; then
        resetBoard
        break
    else
        echo "wrong command, try again."
    fi
  done

  checkgame

# To check the status of the game and to move forward  
    if [ $gamestatus == 0 ]; then
    echo "Gameover"
    player=$((player%2+1))
    echo "Player $player ($sym) win!!"
    echo "Press restart to reset the board"
    while [ 1 == 1 ]; do
        read -r cmd n
        if [ $cmd == "restart" ]; then
          resetBoard
          break
        fi
    done
  fi
done

