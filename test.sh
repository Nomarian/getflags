#!/bin/sh

eval $( flagfmt='b,s,f binary,r res olution,x width' ./getflags.sh.awk -- -b 'hello world' -x 18723   -f 231 -r 1080 1440 END )

echo $flag_r
echo $1
echo $2
