#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
echo "" > log.txt

for var in -v -c -l -n -h -o
do
  for var2 in -v -c -l -n -h -o
  do
      for var3 in -v -c -l -n -h -o
      do
        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
        then
          TEST1="for s_grep.c s_grep.h Makefile $var $var2 $var3"
          echo "$TEST1"
          ./s_grep $TEST1 > s_grep.txt
          grep $TEST1 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

          TEST2="for s_grep.c $var $var2 $var3"
          echo "$TEST2"
          ./s_grep $TEST2 > s_grep.txt
          grep $TEST2 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

          TEST3="-e for -e ^int s_grep.c s_grep.h Makefile $var $var2 $var3"
          echo "$TEST3"
          ./s_grep $TEST3 > s_grep.txt
          grep $TEST3 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

          TEST4="-e for -e ^int s_grep.c $var $var2 $var3"
          echo "$TEST4"
          ./s_grep $TEST4 > s_grep.txt
          grep $TEST4 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST4" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

          TEST5="-e regex -e ^print s_grep.c $var $var2 $var3 -f pattern.txt"
          echo "$TEST5"
          ./s_grep $TEST5 > s_grep.txt
          grep $TEST5 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST5" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

          TEST6="-e while -e void s_grep.c Makefile $var $var2 $var3 -f pattern.txt"
          echo "$TEST6"
          ./s_grep $TEST6 > s_grep.txt
          grep $TEST6 > grep.txt
          DIFF_RES="$(diff -s s_grep.txt grep.txt)"
          if [ "$DIFF_RES" == "Files s_grep.txt and grep.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST6" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s_grep.txt grep.txt

        fi
      done
  done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"