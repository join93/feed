#!/bin/sh
##

version='Ramadan'

echo "===> Downloading '$version' Bootlogos  Please Wait ......"
sleep 10s

if [ ! -d '/usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper' ]; then

cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/display/bootlogo-swapper.tar.gz
tar -xzf bootlogo-swapper.tar.gz -C /

rm -rf *bootlogo-swapper.tar.gz* >/dev/null 2>&1

echo
set +e
cd ..
else
echo ""
fi

rm -rf /usr/lib/enigma2/python/Extensions/BootLogoSwapper/bootlogos/*.mvi


cd /tmp
set -e

wget -O bootlogos-ramadan.tar.gz 'https://raw.githubusercontent.com/join93/feed/main/display/bootlogos-ramadan.tar.gz'

tar -xzf bootlogos-ramadan.tar.gz -C /
set +e
rm -rf *bootlogos-ramadan.tar.gz* >/dev/null 2>&1
cd ..
echo ""
sync
echo "##############################################################"
echo "#       BOOTLOGOS INSTALLED SUCCESSFULLY             #"
echo "#             UPLOADED BY ELIESAT                   #"
echo "##############################################################"
sleep 2
echo
init 3

exit 0
