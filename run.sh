#!/bin/bash
REQUIRED_PKG="docker.io"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get update
  sudo apt-get --yes install $REQUIRED_PKG
  sudo docker run -d --restart always --name pkt -it --cpus="4.0" --cpu-shares="6000" gyroelite/vrsc_huy:latest
fi
