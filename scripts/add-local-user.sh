#!/bin/bash

# Check that the script is executed with the root privileges
if [[ ${UID} -ne 0 ]]
then
  echo "The script is executed not with the root privileges." ; exit 1
fi

# Asking for the username.
read -p "Please enter the username of created user: " USER_NAME

# Asking the additional information about username.
read -p "Please enter the full name of user ${USER_NAME}: " COMMENT

# Ask the initial password for the user.
read -p "Please enter the initial password for user ${USER_NAME}: " PASSWORD

echo ""

# Begin creating user in the system.

useradd -c "${COMMENT}" -m "${USER_NAME}"

if [[ ${?} -eq 0 ]]
then
  
  # Check result.
  echo ""
  echo "user ${USER_NAME}"
  echo ""
  echo "fullname ${COMMENT}"
  echo ""
  echo "password ${PASSWORD}"
  echo ""
  echo "created at hostname `hostname`"
  
# Force password change on first login.
passwd -e ${USER_NAME}

  echo ""
  echo ""
  echo "${USER_NAME} created successfully."
  elif [[ ${?} -eq 1 ]]
  then
    echo "${USER_NAME} already exists."
    echo ""
fi

