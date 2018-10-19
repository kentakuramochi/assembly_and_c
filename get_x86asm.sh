#!/bin/bash

N_ARGS=1

if [ $# -ne ${N_ARGS} ]; then
    echo "input c source"
    exit
fi

fname=$(basename $1)

if [ ${fname##*.} != "c" ]; then
    echo "input c source"
    exit
fi

gcc -m32 -S -O0 $1

