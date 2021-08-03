#!/bin/bash

flagfmt='b,s,f binary,r res olution,x width' ./getflags.bash.awk -- -b 'hello world' -x 18723   -f 231 -r 1080 1440 END -s -b -b -b

eval $( flagfmt='b,s,f binary,r res olution,x width' ./getflags.bash.awk -- -b 'hello world' -x 18723   -f 231 -r 1080 1440 END -s -b -b -b )

echo $flag_s
echo $flag_b
echo $flag_f
echo ${flag_r[0]}
echo ${flag_r[1]}
echo $1
echo $2
