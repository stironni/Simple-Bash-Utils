#!/bin/bash
echo "TEST1"
./s_cat --number-nonblank 1.txt spec.txt > s_cat.txt
cat --number-nonblank 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST2"
./s_cat --number 1.txt spec.txt > s_cat.txt
cat --number 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST3"
./s_cat --number --number-nonblank 1.txt spec.txt > s_cat.txt
cat --number --number-nonblank 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST4"
./s_cat --squeeze-blank 1.txt spec.txt > s_cat.txt
cat --squeeze-blank 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST5"
./s_cat --squeeze-blank --number-nonblank 1.txt spec.txt > s_cat.txt
cat --squeeze-blank --number-nonblank 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST6"
./s_cat --squeeze-blank --number 1.txt spec.txt > s_cat.txt
cat --squeeze-blank --number 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST7"
./s_cat --squeeze-blank --number-nonblank --number 1.txt spec.txt > s_cat.txt
cat --squeeze-blank --number-nonblank --number 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST8"
./s_cat -E 1.txt spec.txt > s_cat.txt
cat -E 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST8"
./s_cat -T 1.txt spec.txt > s_cat.txt
cat -T 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt

echo "TEST9"
./s_cat -T -E --squeeze-blank --number-nonblank --number 1.txt spec.txt > s_cat.txt
cat -T -E --squeeze-blank --number-nonblank --number 1.txt spec.txt > cat.txt
diff -s s_cat.txt cat.txt
rm s_cat.txt cat.txt


