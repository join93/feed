##wget https://raw.githubusercontent.com/join93/feed/main/extensions/keyadder-es.sh -O - | /bin/sh##

version=6.7

cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/extensions/keyadder-"$version".tar.gz
tar -xzf keyadder-"$version".tar.gz -C /

rm -rf *ajpanel-"$version".tar.gz* >/dev/null 2>&1

echo
set +e
cd ..
echo "#                 keyadder-"$version" installed successfully            #"
exit 
