#!/bin/sh

SEARCH_TERM=$1

for EACH in `defaults find $SEARCH_TERM`; do
    echo $EACH
done