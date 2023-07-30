#!/bin/bash

# one file one flag
echo "TEST -e"
./s_grep -e GNU -e Front test2.txt > s_grep.txt
grep -e GNU -e Front test2.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -i"
./s_grep -i nIcE any_file.txt > s_grep.txt
grep -i nIcE any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -c"
./s_grep -c nice any_file.txt > s_grep.txt
grep -c nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -v"
./s_grep -v nice any_file.txt > s_grep.txt
grep -v nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -n"
./s_grep -n nice any_file.txt > s_grep.txt
grep -n nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -h"
./s_grep -h nice any_file.txt > s_grep.txt
grep -h nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -e fail file"
./s_grep -e nice any_file.tt > s_grep.txt
grep -e nice any_file.tt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -s"
./s_grep -s nice any_file.txt > s_grep.txt
grep -s nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -o"
./s_grep -o nice any_file.txt > s_grep.txt
grep -o nice any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt
#
echo "TEST -f"
./s_grep -f pattern.txt any_file.txt > s_grep.txt
grep -f pattern.txt any_file.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt


#two file one flag
echo "TEST -e two files"
./s_grep -e nice any_file.txt test.txt > s_grep.txt
grep -e nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -i two files"
./s_grep -i nIcE any_file.txt test.txt > s_grep.txt
grep -i nIcE any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -c two files"
./s_grep -c nice any_file.txt test.txt > s_grep.txt
grep -c nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -v two files"
./s_grep -v nice any_file.txt test.txt > s_grep.txt
grep -v nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -n two files"
./s_grep -n nice any_file.txt test.txt > s_grep.txt
grep -n nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -h"
./s_grep -h nice any_file.txt test.txt > s_grep.txt
grep -h nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -e two file (fail file)"
./s_grep -e nice any_file.tt test.txt > s_grep.txt
grep -e nice any_file.tt test.txt> grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -s"
./s_grep -s nice any_file.tt test.txt > s_grep.txt
grep -s nice any_file.tt test.txt> grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -o"
./s_grep -o nice any_file.txt test.txt > s_grep.txt
grep -o nice any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt

echo "TEST -f"
./s_grep -f pattern.txt any_file.txt test.txt > s_grep.txt
grep -f pattern.txt any_file.txt test.txt > grep.txt
diff -s s_grep.txt grep.txt
rm s_grep.txt grep.txt
