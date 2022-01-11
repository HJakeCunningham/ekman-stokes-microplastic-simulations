#!/bin/bash
#Script to download Peak Frequency for Jan 2000 - Dec 2014 and split it into single time files
n=0

for y in {2013..2014}
do
  export year=`printf "%04d\n" $y`
  echo "getting files at year $y"
  
  for m in {1..12}
  do
    export month=`printf "%02d\n" $m`
    echo "getting files at month $m"
    wget ftp://ftp.ifremer.fr/ifremer/ww3/HINDCAST/GLOBAL/${year}_CFSR/fp/WW3-GLOB-30M_${year}${month}_fp.nc
	
    for k in {0..300}
    do 
      export name=`printf "%06d\n" $n`
      ncks -d time,$k,$k WW3-GLOB-30M_${year}${month}_fp.nc PFreq${name}.nc
	if [ -e "PFreq${name}.nc" ]
	then
          n=`expr $n + 1`
        fi
    done 
  done
done

for y in {2013..2014}
do
  export year=`printf "%04d\n" $y`
  echo "getting files at year $y"

  for m in {1..12}
  do
    export month=`printf "%02d\n" $m`
    echo "getting files at month $m"
    wget ftp://ftp.ifremer.fr/ifremer/ww3/HINDCAST/GLOBAL/${year}_CFSR/fp/WW3-GLOB-30m_${year}${month}_fp.nc

    for k in {0..300}
    do
      export name=`printf "%06d\n" $n`
      ncks -d time,$k,$k WW3-GLOB-30m_${year}${month}_fp.nc PFreq${name}.nc
	if [ -e "PFreq${name}.nc" ]
	then
          n=`expr $n + 1`
        fi
    done
  done
done 
