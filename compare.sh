#!/bin/bash

RED='\033[0;31m'
LGR='\033[1;32m'
YEL='\033[1;33m'
NC='\033[0m'

dir1="test/output/*"
dir2="test/answers"

if [ $# -ne 1  ]; then
    echo "Usage: $0 [No. | all]"
    exit
fi


if [ ! -d "test/output" ]
then
    echo "[error] should genreate the output/ dir first"
    exit 1
fi

if diff --help 2>&1 | grep "strip-trailing" > /dev/null 2>&1
then
    DIFF="diff -s --strip-trailing-cr"
else
    DIFF="diff -s"
fi

correct=0
pass=0
ignore=0

for file in ${dir1};
do

    ans="${dir2}/`basename $file`"

    ((pass=pass+1))

    # compare the file with answer in answers/
    if [ "$1" != "all" ] && [ $(printf "%02d" $pass) == $(printf "%02d" $1) ]
    then
        vimdiff -c ":botright split test/`basename \"${file%.*}\"`.p" "${file}" "${ans}"
        exit
    fi

    if $DIFF "${file}" "${ans}" > /dev/null
    then
        :
        #vimdiff -c ":botright split test/`basename \"${file%.*}\"`.p" "${file}"
    else
       if [ "$1" == "all" ]
       then
        vimdiff -c ":botright split test/`basename \"${file%.*}\"`.p" "${file}" "${ans}"
       fi
    fi
done
