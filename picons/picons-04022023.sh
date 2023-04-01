
#!/bin/sh
#

wget -O /var/volatile/tmp/picon-01042023.tar.gz "https://onedrive.live.com/download?cid=C83DE969086F8746&resid=C83DE969086F8746%211135&authkey=AFungx23Dc4KHlk"

echo ""
# Download and install feed
cd /tmp
set -e
tar -xzf picon-01042023.tar.gz -C /
set +e
rm -f picon-01042023.tar.gz

echo ""
sync
echo "##############################################################"
echo "#         PICONS INSTALLED SUCCESSFULLY             #"
echo "#             UPLOADED BY ELIESAT                #"
echo "##############################################################"

echo "#              RESTART YOUR STB NOW                  #"
echo "##############################################################"

exit 0















































































