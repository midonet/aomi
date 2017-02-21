#!/bin/bash
#
# Fix missing hostname in cloud images
#
HOSTNAME=`hostname -s`

if ! ping -c 1 $HOSTNAME &> /dev/null; then
  sudo sed -i "/^127\.0\.0\.1/s/$/ $HOSTNAME/" /etc/hosts &> /dev/null && \
  echo "Added '$HOSTNAME' to /etc/hosts."
fi
