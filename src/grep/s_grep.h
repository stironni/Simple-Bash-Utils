#ifndef SRC_GREP_S_GREP_H_
#define SRC_GREP_S_GREP_H_

#include <errno.h>
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
} Flags;

void parser(int argc, char *argv[], Flags *flags, char regex[100][1000],
            char files[100][1000], int *count_regex, int *count_files);
void searching(Flags *flags, int count_regex, int count_files, regex_t *gex,
               regmatch_t *match, char regex[100][1000], char files[100][1000],
               int j, char *string, int *count_for_c, int *count_for_l,
               int *count_for_n);

#endif  // SRC_GREP_S_GREP_H_
