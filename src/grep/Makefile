CC = gcc
OS = $(shell uname -s)
ifeq ($(OS), Linux)
	FLAGS := -Wall -Werror -Wextra -std=c11 -D_GNU_SOURCE
else
	FLAGS := -Wall -Werror -Wextra -std=c11
endif

all: clean test

s_grep: s_grep.c
	@$(CC) $(FLAGS) s_grep.c -o s_grep

test: s_grep
	sh test_grep.sh

check:
	@cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	@cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	@python3 ../../materials/linters/cpplint.py --extension=c *.c *.h

clean:
	@rm -rf *.o *.gc* *log* s_grep

.PHONY: all test clean s_grep