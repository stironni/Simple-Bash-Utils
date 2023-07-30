#include "s_grep.h"

int main(int argc, char *argv[]) {
  Flags flags = {.e = 0,
                 .i = 0,
                 .v = 0,
                 .c = 0,
                 .l = 0,
                 .n = 0,
                 .h = 0,
                 .s = 0,
                 .f = 0,
                 .o = 0};
  char regex[100][1000];
  char files[100][1000];
  int count_regex = 0;
  int count_files = 0;
  regex_t gex;
  regmatch_t match;
  parser(argc, argv, &flags, regex, files, &count_regex, &count_files);
  for (int j = 0; j < count_files; j++) {
    FILE *file;
    if ((file = fopen(files[j], "r")) == NULL) {
      if (!flags.s)
        fprintf(stderr, "cat: %s: No such file or directory\n", files[j]);
      continue;
    } else {
      size_t size_file = 0;
      char *string = NULL;
      int count_for_c = 0;
      int count_for_l = 0;
      int count_for_n = 0;
      while (getline(&string, &size_file, file) != -1) {
        searching(&flags, count_regex, count_files, &gex, &match, regex, files,
                  j, string, &count_for_c, &count_for_l, &count_for_n);
      }
      free(string);
      if (flags.c) {
        if (count_files > 1 && !flags.h) printf("%s:", files[j]);
        printf("%d\n", count_for_c);
      }
      if (count_for_l > 0) printf("%s\n", files[j]);
      fclose(file);
    }
  }
  return 0;
}

void parser(int argc, char *argv[], Flags *flags, char regex[100][1000],
            char files[100][1000], int *count_regex, int *count_files) {
  int index = 0;
  while ((index = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, NULL)) != -1) {
    switch (index) {
      case 'e':
        flags->e = 1;
        strcpy(regex[*count_regex], optarg);
        *count_regex += 1;
        break;
      case 'i':
        flags->i = 1;
        break;
      case 'v':
        flags->v = 1;
        break;
      case 'c':
        flags->c = 1;
        break;
      case 'l':
        flags->l = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 'h':
        flags->h = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 'f':
        flags->f = 1;
        FILE *file;
        if ((file = fopen(optarg, "r")) == NULL) {
          if (!flags->s) perror(optarg);
          exit(0);
        } else {
          size_t size_file = 0;
          char *cf = NULL;
          while ((getline(&cf, &size_file, file)) != -1) {
            strcpy(regex[*count_regex], cf);
            *count_regex += 1;
          }
          free(cf);
          flags->e = 1;
          fclose(file);
        }
        break;
      case 'o':
        flags->o = 1;
        break;
    }
  }
  if (!flags->e && argc - optind > 1) {
    for (int i = optind + 1; i < argc; i++) {
      strcpy(files[*count_files], argv[i]);
      *count_files += 1;
    }
  } else {
    for (int i = optind; i < argc; i++) {
      strcpy(files[*count_files], argv[i]);
      *count_files += 1;
    }
  }
  if (!flags->e) {
    strcpy(regex[*count_regex], argv[optind]);
    *count_regex += 1;
  }
}

void searching(Flags *flags, int count_regex, int count_files, regex_t *gex,
               regmatch_t *match, char regex[100][1000], char files[100][1000],
               int j, char *string, int *count_for_c, int *count_for_l,
               int *count_for_n) {
  for (int i = 0; i < count_regex; i++) {
    if (!flags->i) regcomp(gex, regex[i], REG_EXTENDED);
    if (flags->i) regcomp(gex, regex[i], REG_ICASE);
    if (flags->v) {
      if (flags->n) *count_for_n += 1;
      if (regexec(gex, string, 1, match, 0) != 0) {
        if (flags->c && flags->l) {
          *count_for_c = 1;
          *count_for_l = 1;
          regfree(gex);
          break;
        }
        if (flags->c) {
          *count_for_c += 1;
          regfree(gex);
          break;
        }
        if (flags->l) {
          *count_for_l += 1;
          regfree(gex);
          break;
        }
        if (count_files > 1 && !flags->h) printf("%s:", files[j]);
        if (flags->n) printf("%d:", *count_for_n);
        printf("%s", string);
        if (strchr(string, '\n') == NULL) printf("\n");
        regfree(gex);
        break;
      }
    }
    if (!flags->v) {
      if (flags->n) *count_for_n += 1;
      if (regexec(gex, string, 1, match, 0) == 0) {
        if (flags->c && flags->l) {
          *count_for_c = 1;
          *count_for_l = 1;
          regfree(gex);
          break;
        }
        if (flags->c) {
          *count_for_c += 1;
          regfree(gex);
          break;
        }
        if (flags->l) {
          *count_for_l += 1;
          regfree(gex);
          break;
        }
        if (count_files > 1 && !flags->h) printf("%s:", files[j]);
        if (flags->n) printf("%d:", *count_for_n);
        if (flags->o) {
          while (regexec(gex, string, 1, match, 0) == 0) {
            for (; match->rm_so < match->rm_eo; match->rm_so++)
              printf("%c", string[match->rm_so]);
            printf("\n");
            string = string + match->rm_eo;
          }
        } else {
          printf("%s", string);
          if (strchr(string, '\n') == NULL) printf("\n");
          regfree(gex);
          break;
        }
      }
    }
    regfree(gex);
  }
}
