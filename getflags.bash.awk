#!/usr/bin/awk -f

# this will print out shellscript
# you must load/source it

# use as ; flagfmt='b,s,f binary,r res olution,x width' ./getflags.sh.awk -- -b hello world -x 18723 -f 231 -r 1080 1440

# There is few error detection, if flagfmt is set up incorrectly (a flag having a -b) it will fail

function sanitize(s){ gsub(/'/,"\\'",s); return s }

BEGIN {
 for (i=1+split(ENVIRON["flagfmt"],f1,",");--i;)
  flag[ f[1] ] = split(f1[i],f) # sanitize?

 argc=ARGC-1
 prepend = "flag_"

 while (++i<=argc) { # loop through args
  arg = ARGV[i]; sub(/^\-+/,"",arg)
  if ( flag[ arg ] ) {
    if (flag[arg]==1) {
     countflags[arg]++
    } else { # loop through how many arguments flag has
     printf("%s%s=('%s'",prepend,arg,sanitize(ARGV[++i]) )

     for (x=flag[arg]-1;--x && i++<=argc;)
      printf " '%s'",sanitize(ARGV[i])

     printf");"
    }
  } else {
   args[++argsl] = sanitize(ARGV[i])
  }
 }

 for (i in countflags)
  printf("%s%s=%i;",prepend,i,countflags[i])

 printf "set"
  for (i in args) printf(" '%s'", args[i])
 print
}
