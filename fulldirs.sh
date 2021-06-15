#!/bin/bash

if [[ `id -u` -ne 0 ]]
  then echo "You have little rights"
  exit 1
fi

NODA=dmgr

for (( i = 1; i < 9; i++ )) do
  touch /opt/esb/profiles62/${NODA}/temp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/config/temp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/wstemp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/tranlog/"somelog${RANDOM}.log"
done

NODA=wps

for (( i = 1; i < 9; i++ )) do
  touch /opt/esb/profiles62/${NODA}/temp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/config/temp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/wstemp/"somelog${RANDOM}.log"
  touch /opt/esb/profiles62/${NODA}/tranlog/"somelog${RANDOM}.log"
done
