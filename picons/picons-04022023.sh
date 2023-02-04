
#!/bin/sh
#

wget -O /var/volatile/tmp/picon-04022023.tar.gz "https://onedrive.live.com/download?cid=C83DE969086F8746&resid=C83DE969086F8746%211120&authkey=ABoGMkeGhKTaZQ8"

echo ""
# Download and install feed
cd /tmp
set -e
tar -xzf picon-04022023.tar.gz -C /
set +e
rm -f picon-04022023.tar.gz

echo ""
sync
echo "##############################################################"
echo "#         PICONS INSTALLED SUCCESSFULLY             #"
echo "#             UPLOADED BY ELIESAT                #"
echo "##############################################################"

echo "#              RESTART YOUR STB NOW                  #"
echo "##############################################################"

exit 0















































































