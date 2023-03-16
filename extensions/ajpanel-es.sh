##wget https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-es.sh -O - | /bin/sh##

version=8.8.0

cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-"$version".tar.gz
tar -xzf ajpanel-"$version".tar.gz -C /

rm -rf *ajpanel-"$version".tar.gz* >/dev/null 2>&1

echo
set +e
cd ..
echo "#                 ajpanel-"$version" installed successfully            #"
exit 
