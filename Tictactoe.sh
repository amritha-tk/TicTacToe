#!/bin/bash

echo "WELCOME"
resetBoard(){
  echo "====================="
  Arr=(. . . . . . . . .)
  CheckArr=Arr
  gamestatus="Lose"
  echo "====================="
  echo "Game started"
}


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


winCheck() {
rowCheck
}

rowCheck(){

#checkmatch 0 1 2
#checkmatch 3 4 5
#checkmatch 6 7 8

for (( firstnum=0; $firstnum -le $size*$size; $firstnum+$size ))
	do

	secondnum=$(($firstnum+1))
	thirdnum=$(($firstnum+2))

	if [ ${Arr[$firstnum]} != "." ] && [ ${Arr[$firstnum]} == ${Arr[$secondnum]} ] && [ ${Arr[$secondnum]} == ${Arr[$thirdnum]} ]
	then
		gamestatus=="Win"
	else
	    columnCheck
	fi
	done
0===0}


columnCheck(){

#checkmatch 0 3 6
#checkmatch 1 4 7
#checkmatch 2 5 8

for (( firstnum=0; $firstnum -le $size*$size; $firstnum++ ))
	do
	secondnum=$(($firstnum+3))
	thirdnum=$(($firstnum+6))
	
	if [ ${Arr[$firstnum]} != "." ] && [ ${Arr[$firstnum]} == ${Arr[$secondnum]} ] && [ ${Arr[$secondnum]} == ${Arr[$thirdnum]} ] 
	then
		gamestatus=="Win"
		
	else
	    diagonalCheck
	fi
	
	done
}

diagonalCheck(){
#checkmatch 0 4 8
#checkmatch 2 4 6

#Diagonal check left
    firstnum=0 
	secondnum=$(($firstnum+4))
	thirdnum=$(($secondnum+4))
	
	if [ ${Arr[$firstnum]} != "." ] && [ ${Arr[$firstnum]} == ${Arr[$secondnum]} ] && [ ${Arr[$secondnum]} == ${Arr[$thirdnum]} ]
	then
		gamestatus=="Win"
	fi
}
	
#Diagonal check right
    firstnum=2
	secondnum=$(($firstnum+2))
	thirdnum=$(($secondnum+2))
	
	if [ ${Arr[$firstnum]} != "." ] && [ ${Arr[$firstnum]} == ${Arr[$secondnum]} ] && [ ${Arr[$secondnum]} == ${Arr[$thirdnum]} ]
	then
		gamestatus=="Win"
	fi	
}



FillPositionWinBlock() {

if [ ${CheckArr[$firstnum]} == 0 ]
		then
			${Arr[$firstnum]} = $sym
			filled=1
		
		elif [ ${CheckArr[$secondnum]} == 0 ]
		then
			${Arr[$secondnum]} = $sym
			filled=1
			
		else
			${Arr[$thirdnum]} = $sym
			filled=1
		
		fi
}




convertBlockToNumbers(){

CheckArr=Arr

# For getting opponent symbol
opp_sym_num = $((sym_num%2+1))
case  $opp_sym_num in
    1)
      opp_sym="X"
      ;;
    2)
      opp_sym="O"
      ;;
    *)
      echo "Unknown symbol"
      ;;
esac

# For assigining table to numerical values
for (( checkpos=0; $checkpos -lt $size*$size; $checkpos++ ))
	do
	
	CheckArr[$checkpos] 
	case  ${Arr[$checkpos]} in
    $sym)
		CheckArr[$checkpos]=1
		;;
    $opp_sym)
		CheckArr[$checkpos]=4
		;;
    ".")
		CheckArr[$checkpos]=0
      ;;
    esac
	
	done
}

CompPlayGame() {

local filled=0
local wincount=2
local blockcount=8

convertBlockToNumbers

winBlockRowPosition $wincount

if [ $filled == 0 ]; then
	winBlockRowPosition $blockcount
fi
}

winBlockRowPosition() {


#checkmatch 0 1 2
#checkmatch 3 4 5
#checkmatch 6 7 8

for (( firstnum=0; $firstnum -le $size*$size && filled=0; $firstnum+$size ))
	do
	
	secondnum=$(($firstnum+1))
	thirdnum=$(($firstnum+2))
	
	if [ ${CheckArr[$firstnum]}+${CheckArr[$secondnum]}+${CheckArr[$thirdnum]} == $1 ]
	then
		FillPositionWinBlock
	else 
		winColumnPosition
	fi
	
done

}

winBlockColumnPosition() {

for (( firstnum=0; $firstnum -le $size*$size && filled=0; $firstnum+$size ))
	do
	
	secondnum=$(($firstnum+3))
	thirdnum=$(($firstnum+6))
	
	if [ ${CheckArr[$firstnum]}+${CheckArr[$secondnum]}+${CheckArr[$thirdnum]} == $1 ]
	then
		FillPositionWinBlock
	else 
		winDiagPosition
	fi
	
done
}

winBlockDiagPosition() {

#Diagonal check left

    firstnum=0 
	secondnum=$(($firstnum+4))
	thirdnum=$(($secondnum+4))
	
	if [ ${CheckArr[$firstnum]}+${CheckArr[$secondnum]}+${CheckArr[$thirdnum]} == $1 ]
	then
		FillPositionWinBlock
	else


#Diagonal check right
    firstnum=2
	secondnum=$(($firstnum+2))
	thirdnum=$(($secondnum+2))
	

	if [ ${CheckArr[$firstnum]}+${CheckArr[$secondnum]}+${CheckArr[$thirdnum]} == $1 ]
		then
			FillPositionWinBlock 
	fi
fi
}


getSymbol(){

    case  $1 in
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

}

changeSymbol(){

sym_num=$((sym_num%2+1))
getSymbol $sym_num

}



set(){

idx=$(( $1 * 3 + $2 ))
	if [ ${Arr[$idx]} == "." ]; then
    Arr[$idx]=$3
    player=$((player%2+1))

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

case $player in

1)
# For player 1 : Manual selection
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
		changeSymbol
        #break
    elif [ $cmd == "restart" ]; then
        resetBoard
        #break
    else
        echo "wrong command, try again."
    fi
	done
;;

2)
# For player 2 : Computer selection

CompPlayGame
changeSymbol
;;
esac

winCheck

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


