#!/bin/bash

echo

# Check that the script is executed with the root privileges
if [[ ${UID} -ne 0 ]]
then
  echo "The script is executed not with the root privileges." ; exit 1
fi

# Providing a usage statement.
echo "=============================================================="
echo
echo "This script is working correct with the root rights"
echo
echo "=============================================================="
echo
echo "You should use this script with 2 arguments like:"
echo
echo
echo "sudo ./add-new-local-user.sh jimmyh Jimmy Henderson Jr. "
echo
echo "=============================================================="
echo
echo "First parameter means the username and the rest is a comment"
echo
echo "=============================================================="

# Check that arguments provided.
if [[ ${#} -lt 2 ]]
  then
  echo
  echo "Provided not correct arguments."
  echo
  exit 1
fi

# Loop through all the positional parameters to parse them.

USER_NAME=${1}
DIRECTOR=${#}
DIRECTOR=$((${DIRECTOR} - 1))

while [[ "${#}" -ge ${DIRECTOR} ]]
do
  COMMENT="${@}"
  shift
done

# Generating password

SYMBOLS='!@#$%^&*()_-+='
BIGLETTERS='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
SMLETTERS='abcdefghijklmnopqrstuvwxyz'

for ((x=1; x < 14; x++))
do	

NUMBERS=$((${RANDOM} % 100))
BLPOSITION=$((${RANDOM} % 26))
SLPOSITION=$((${RANDOM} % 26))
SPOSITION=$((${RANDOM} % 14))

BLTARGET=${BIGLETTERS: ${BLPOSITION}}
SLTARGET=${SMLETTERS: ${SLPOSITION}}
STARGET=${SYMBOLS: ${SPOSITION}}

BIGLETTER=`echo ${BLTARGET} | head -c1`
SMLETTER=`echo ${SLTARGET} | head -c1`
SYMBOL=`echo ${STARGET} | head -c1`

VARIF=$((${RANDOM} % 4)) 

if [[ ${VARIF} -eq 0 ]]
then
  PASSWORD="${PASSWORD}${NUMBERS}"

elif [[ ${VARIF} -eq 1 ]]
  then
  PASSWORD="${PASSWORD}${BIGLETTER}"

elif [[ ${VARIF} -eq 2 ]]
  then
  PASSWORD="${PASSWORD}${SYMBOL}"

elif [[ ${VARIF} -eq 3 ]]
  then
  PASSWORD="${PASSWORD}${SMLETTER}"

fi

done

PASSWORD=`echo ${PASSWORD} | head -c10`


# Begin creating user in the system.

useradd -c "${COMMENT}" -m "${USER_NAME}"

echo
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Expire password for user.
echo ${EXPIRE}
passwd -e ${USER_NAME}

if [[ ${?} -eq 0 ]]
then
  
  # Check result.
  echo
  echo "=============================================================="
  echo
  echo "User:"
  echo
  echo "${USER_NAME}"
  echo
  echo "=============================================================="
  echo  
  echo "Comment:"
  echo
  echo "${COMMENT}"
  echo
  echo "=============================================================="
  echo
  echo "Password:"
  echo
  echo "${PASSWORD}"
  echo
  echo "=============================================================="
  echo  
  echo "Created at hostname:"
  echo
  echo `hostname`
  echo
  echo "=============================================================="

elif [[ ${?} -eq 1 ]]
then
  echo
  echo "Username was not entered or entered not correct."
  echo
fi
