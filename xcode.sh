#!/bin/bash

# My hack to run transcoding across a directory
# - on ubuntu 16.04

# pad tisk and file numbers out to two digits

# disc number: first option (if any)
disc_num=${1:-0}
(( ${#disc_num} > 1 )) || disc_num=0$disc_num
shift
# input path: second option (if any):
inp=${1:-'/run/user/1000/gvfs/cdda:host=sr0'}
shift
# output path: third option (if any):
oup=${1:-$HOME/Music}

echo "disc number $disc_num..."
echo "from: $inp"
echo "to:   $oup"

for i in $inp/*; do
    n=${i#* }
    n=${n%.wav}
    (( ${#n} == 1 )) && n=0$n
    echo "${i##*/} => disc$disc_num-$n.ogg"
    # echo ./audiotranscoder "$i" "${oup}/disc$disc_num-$n.ogg"
    ./audiotranscoder "$i" "${oup}/disc$disc_num-$n.ogg"
done

