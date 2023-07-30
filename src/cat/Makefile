CC = gcc
OS = $(shell uname -s)
ifeq ($(OS), Linux)
	FLAGS := -Wall -Werror -Wextra -std=c11 -D_GNU_SOURCE
else
	FLAGS := -Wall -Werror -Wextra -std=c11
endif

all: clean test

s_cat: s_cat.c
	@$(CC) $(FLAGS) s_cat.c -o s_cat

test: s_cat
	sh t_cat.sh

check:
	@cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	@cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	@python3 ../../materials/linters/cpplint.py --extension=c *.c *.h

clean:
	@rm -rf *.o *.gc* *log* s_cat

.PHONY: all test clean s_cat