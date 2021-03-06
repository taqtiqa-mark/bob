#!/usr/bin/env sh

# Requires
# - common-setup.sh
# - ./bob/bob.sh
#

source ./common-setup.sh

# # cat /etc/os-release
# NAME="Alpine Linux"
# ID=alpine
# VERSION_ID=3.7.0
# PRETTY_NAME="Alpine Linux v3.7"
# HOME_URL="http://alpinelinux.org"
# BUG_REPORT_URL="http://bugs.alpinelinux.org"
source /etc/os-release

export DISTRIB_ID=${ID}
export DISTRIB_RELEASE=${VERSION_ID} 
# 3.7.0 -> 3.7     
export DISTRIB_CODENAME=${VERSION_ID%.*}
export DISTRIB_DESCRIPTION="${PRETTY_NAME}"

echo "export DISTRIB_ID=${ID}" >> /etc/profile.d/bob.sh
echo "export DISTRIB_RELEASE=${VERSION_ID}" >> /etc/profile.d/bob.sh
echo "export DISTRIB_CODENAME=${VERSION_ID%.*}" >> /etc/profile.d/bob.sh
echo "export DISTRIB_DESCRIPTION=\"${PRETTY_NAME}\"" >> /etc/profile.d/bob.sh
echo "export OCI_USER=${OCI_USER}" >> /etc/profile.d/bob.sh
echo "export OCI_USER_ID=${OCI_USER_ID}" >> /etc/profile.d/bob.sh
echo "export OCI_USER_GROUP_ID=${OCI_USER_GROUP_ID}" >> /etc/profile.d/bob.sh
echo "export OCI_USER_GROUP=${OCI_USER_GROUP}" >> /etc/profile.d/bob.sh

#
# Load required env variables is case we are building 
# in the same shell session
#
for f in /etc/profile.d/*; do source $f; done

# source ./bob/bob.sh

setup-hostname alpine
