#! /bin/bash

LC_ALL=C tr -dc "[:alnum:],[:punct:]" < /dev/urandom | head -c $1 | pbcopy
# https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html