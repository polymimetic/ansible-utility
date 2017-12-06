#!/bin/bash
set -e
###########################################################################
#
# Ansible Role Installer
# https://github.com/polymimetic/ansible-utility
#
# Usage: [OPTIONS] ./role-init.sh
#   - name: the name of the ansible role to create (default = "test-role")
#   - skel: a path to the role skeleton (default = "$(dirname "$PWD")/$SKEL_DIR")
#   - path: where to init the newly created role (default = "$(dirname $(dirname "$PWD"))")
#
# Example: name=foobar skel=/path/to/skeleton path=/path/to/role ./tests/test.sh
#
###########################################################################

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

###########################################################################
# Constants and Variables
###########################################################################

readonly SKEL_REPO="https://github.com/polymimetic/ansible-role-skeleton.git"
readonly SKEL_NAME="ansible-role-skeleton"
readonly SKEL_PATH="$(dirname $(dirname "$PWD"))/${SKEL_NAME}"

# Pretty colors.
red='\033[0;31m'
green='\033[0;32m'
neutral='\033[0m'

# Allow environment variables to override defaults.
name=${name:-"test-role"}
skel=${skel:-"$(dirname $(dirname "$PWD"))/$SKEL_NAME"}
path=${path:-"$(dirname $(dirname "$PWD"))"}

###########################################################################
# Program Start
###########################################################################

if [[ -d "$skel" ]]; then
  printf ${green}"Building role from skeleton: $skel"${neutral}"\n"
  
  ansible-galaxy init --role-skeleton=${skel} --init-path=${path} ${name}

  if [[ -d "${path}/${name}/.git" ]]; then
    rm -r "${path}/${name}/.git"
  fi

  printf ${green}"✔ Role build complete!"${neutral}"\n"

elif [[ ! -d "$skel" ]]; then
  printf ${red}"Skeleton missing. Cloning from GitHub: $SKEL_REPO"${neutral}"\n"

  git clone $SKEL_REPO $SKEL_PATH
  ansible-galaxy init --role-skeleton=${SKEL_PATH} --init-path=${path} ${name}

  if [[ -d "${path}/${name}/.git" ]]; then
    rm -r "${path}/${name}/.git"
  fi

  printf ${green}"✔ Role build complete!"${neutral}"\n"
fi
