
!/bin/sh
# 

wget -O /var/volatile/tmp/picon-osn-04022023.tar.gz "https://onedrive.live.com/download?cid=C83DE969086F8746&resid=C83DE969086F8746%211121&authkey=ABDRqFc1wKCkMgo" 

echo ""
# Download and install feed
cd /tmp
set -e
tar -xzf picon-osn-04022023.tar.gz -C /
set +e
rm -f picon-osn-04022023.tar.gz 

echo ""
sync
echo "##############################################################"
echo "#       OSN PICONS INSTALLED SUCCESSFULLY             #"
echo "#             UPLOADED BY ELIESAT                #"
echo "##############################################################" 

echo "#              RESTART YOUR STB NOW                  #"
echo "##############################################################" 

exit 0








































































