#!/usr/bin/env bash
# File: guessinggame.sh

function guess
{
  local ex=0
  echo "Welcome, your inputs in this program can be a floating number which will be truncated. For example, -03.45 will be -3."
  echo "Please don't input them though; rather, please insert a natural number such as 0, 1, 2, 3, etc."
  echo "Also, please don't insert a non-numerical value too. It will be accepted as 0."
  read -p "Guess how many files are in this directory: " ex
  ex=$( echo "$ex / 1" | bc )
  while (( ex != $( ls -l . | egrep -c '^-' ) )) 
  do
    if (( ex < $( ls -l . | egrep -c '^-' ) ))
    then
      read -p "Wrong, increase the value that you have guessed. " ex
      if [[ ! $ex =~ ^[0-9]+$ ]]
      then
        echo "ERROR: THAT'S NOT A NATURAL NUMBER! RESTARTING PROGRAM WITH 0."
        ex=0
      else
        echo -n
      fi
    elif (( ex > $( ls -l . | egrep -c '^-' ) ))
    then
      read -p "Wrong, decrease the value that you have guessed. " ex
      if [[ ! $ex =~ ^[0-9]+$ ]]
      then
        echo "ERROR: THAT'S NOT A NATURAL NUMBER! RESTARTING PROGRAM WITH 0."
        ex=0
      else
        echo -n
      fi
    else
      echo "ERROR: THAT'S NOT A NATURAL NUMBER! RESTARTING PROGRAM WITH 0."
      ex=0       
    fi
  done
  echo "Congratulations! You have guessed correctly: $ex"
}

guess
