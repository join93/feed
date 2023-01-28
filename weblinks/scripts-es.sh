##wget https://raw.githubusercontent.com/join93/feed/main/weblinks/scripts-es.sh -O - | /bin/sh##
if [ ! -d "/usr/script" ]; then
mkdir /usr/script
fi
cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/weblinks/scripts.tar.gz
tar -xzf scripts.tar.gz -C /

rm -rf *scripts.tar.gz* >/dev/null 2>&1

echo
set +e
cd ..

chmod 755 /usr/script/*.sh

echo "#                 scripts installed successfully            #"
exit 
