#!/bin/bash
set -e
###########################################################################
#
# Ansible Role Installer
# https://github.com/polymimetic/ansible-roles
#
# Usage: [OPTIONS] ./role-init.sh
#   - name: the name of the ansible role to create (default = "test-role")
#   - skel: a playbook in the tests directory (default = "$(dirname "$PWD")/$SKEL_DIR")
#
# Example: name=foobar skel=/path/to/skeleton ./tests/test.sh
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
readonly SKEL_DIR="ansible-role-skeleton"

# Pretty colors.
red='\033[0;31m'
green='\033[0;32m'
neutral='\033[0m'

# Allow environment variables to override defaults.
name=${name:-"test-role"}
skel=${skel:-"$(dirname "$PWD")/$SKEL_DIR"}

###########################################################################
# Program Start
###########################################################################

if [[ -d "$skel" ]]; then
  printf ${green}"Building role from skeleton: $skel"${neutral}"\n"
  ansible-galaxy init --role-skeleton=${skel} ${name}
  printf ${green}"✔ Role build complete!"${neutral}"\n"
elif [[ ! -d "$skel" ]]; then
  printf ${red}"Skeleton missing. Cloning from GitHub: $SKEL_REPO"${neutral}"\n"
  git clone $SKEL_REPO $SKEL_DIR
  ansible-galaxy init --role-skeleton=${SKEL_DIR} ${name}
  printf ${green}"✔ Role build complete!"${neutral}"\n"
fi
