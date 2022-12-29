#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -ne 1 ]; then
    echo "Usage: chktex.sh [FileWithoutExtension]"
    exit 1
fi

main_file=$1

if test -f "$DIR/$main_file.chk"; then
    rm $DIR/$main_file.chk
fi

chktex -l $DIR/.chktexrc $DIR/$main_file.tex -o $DIR/$main_file.chk
chk_out=`cat $DIR/$main_file.chk`

if [ ${#chk_out} -gt 0 ]; then
    cat $DIR/$main_file.chk
    rm $DIR/$main_file.chk
    exit 1
else
    echo "chktex did not find any issues"
    exit 0
fi