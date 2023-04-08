#!/bin/sh
##

version=07.04.2023

echo "===> Downloading  HazemWahba Motor Channels List "$version" Please Wait ......"
sleep 10s

wget -O /var/volatile/tmp/hazemwahba.motor.tar.gz "https://raw.githubusercontent.com/join93/feed/main/settings/hazemwahba.motor-"$version".tar.gz"

echo ""


rm -rf /etc/enigma2/lamedb
rm -rf /etc/enigma2/*list
rm -rf /etc/enigma2/*.tv
rm -rf /etc/enigma2/*.radio
rm -rf /etc/tuxbox/*.xml


cd /tmp
set -e

echo "===> Installing  HazemWahba Motor Channels List "$version" Please Wait ......"
sleep 10s
echo
tar -xvf hazemwahba.motor.tar.gz -C /
set +e
rm -f hazemwahba.motor.tar.gz
echo
echo "   >>>>   Reloading Services - Please Wait   <<<<"
wget -qO - http://127.0.0.1/web/servicelistreload?mode=0 > /dev/null 2>&1
sleep 2
echo
init 3

echo ""
sync
echo "##############################################################"
echo "#       CHANNELS INSTALLED SUCCESSFULLY             #"
echo "#             UPLOADED BY ELIESAT                   #"
echo "##############################################################"
echo "**************************************************************"
echo "##############################################################"
echo "#              RESTART YOUR STB NOW                  #"
echo "##############################################################"

exit 0
