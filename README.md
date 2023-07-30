## Introduction

В этом проекте разработаны базовые утилиты Bash по работе с текстами на языке программирования Си. Эти утилиты (cat и grep) достаточно часто используются при работе в терминале Linux. В рамках этого проекта предполагается знакомство с организацией утилит Bash и закрепление структурного подхода.

Cat - одна из наиболее часто используемых команд в Unix-подобных операционных системах. Команда имеет три взаимосвязанные функции в отношении текстовых файлов: отображение, объединение их копий и создание новых.

`cat [OPTION] [FILE]...`

### cat Опции

| №   | Опции                                                                 | Описание                                    |
| --- | --------------------------------------------------------------------- | ------------------------------------------- |
| 1   | -b (GNU: --number-nonblank)                                           | нумерует только непустые строки             |
| 2   | -e предполагает и -v (GNU only: -E то же самое, но без применения -v) | также отображает символы конца строки как $ |
| 3   | -n (GNU: --number)                                                    | нумерует все выходные строки                |
| 4   | -s (GNU: --squeeze-blank)                                             | сжимает несколько смежных пустых строк      |
| 5   | -t предполагает и -v (GNU: -T то же самое, но без применения -v)      | также отображает табы как ^I                |

### grep Использование

`grep [options] template [file_name]`

### grep Опции

| №   | Опции   | Описание                                                               |
| --- | ------- | ---------------------------------------------------------------------- |
| 1   | -e      | Шаблон                                                                 |
| 2   | -i      | Игнорирует различия регистра.                                          |
| 3   | -v      | Инвертирует смысл поиска соответствий.                                 |
| 4   | -c      | Выводит только количество совпадающих строк.                           |
| 5   | -l      | Выводит только совпадающие файлы.                                      |
| 6   | -n      | Предваряет каждую строку вывода номером строки из файла ввода.         |
| 7   | -h      | Выводит совпадающие строки, не предваряя их именами файлов.            |
| 8   | -s      | Подавляет сообщения об ошибках о несуществующих или нечитаемых файлах. |
| 9   | -f file | Получает регулярные выражения из файла.                                |
| 10  | -o      | Печатает только совпадающие (непустые) части совпавшей строки.         |

- Программы разработаны на языке Си стандарта C11 с использованием компилятора gcc
- Код программ cat и grep находится папках src/cat/ и src/grep/ соответственно
- Сборка программ настроена с помощью Makefile с соответствующими целями: s_cat, s_grep
- Осуществленно покрытие интеграционными тестами для всех вариантов флагов и входных значений, на базе сравнения с поведением реальных утилит Bash

## Part 1. Работа с утилитой cat

Разработана утилита cat:

- Поддержка всех флагов (включая GNU версии), указанных [выше](#cat-опции)
- Исходные, заголовочные и сборочный файлы располагаются в директории src/cat/
- Итоговый исполняемый файл располагается в директории src/cat/ и называться s_cat

## Part 2. Работа с утилитой grep

Разработана утилиту grep:

- Поддержка следующих флагов: `-e`, `-i`, `-v`, `-c`, `-l`, `-n`, `-h`, `-s`, `-f`, `-o`
- Поддержка всех флагов, включая их _парные_ комбинации (например, `-iv`, `-in`)
- Исходные, заголовочные и сборочный файлы располагаются в директории src/grep/
- Итоговый исполняемый файл располагается в директориии src/grep/ и называться s_grep