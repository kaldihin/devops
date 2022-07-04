#/bin/bash

declare -a files1=`ls ./dir1`
declare -a files2=`ls ./dir2`

declare -a result

#echo $files1
#echo $files2

for i in $files1
  do
    if [ ! -e ./dir2/$i ]
      then
        result=$result' '$i
    fi
done

for k in $files2
  do
    if [ ! -e ./dir1/$k ]
      then
        result=$result' '$k
    fi
done

echo $result
