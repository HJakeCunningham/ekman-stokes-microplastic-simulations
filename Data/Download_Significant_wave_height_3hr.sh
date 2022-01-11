#!/bin/bash
#Script to download Peak Frequency for Jan 2000 - Dec 2014 and split it into single time files
n=0

for y in {2002..2003}
do
  export year=`printf "%04d\n" $y`
  echo "getting files at year $y"
  
  for m in {1..12}
  do
    export month=`printf "%02d\n" $m`
    echo "getting files at month $m"
    wget ftp://ftp.ifremer.fr/ifremer/ww3/HINDCAST/GLOBAL/${year}_CFSR/hs/WW3-GLOB-30M_${year}${month}_hs.nc
  done
done