##wget https://raw.githubusercontent.com/join93/feed/main/weblinks/scripts.sh -O - | /bin/sh##

cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/weblinks/scripts.tar.gz
tar -xzf scripts.tar.gz -C /

rm -rf *scripts.tar.gz* >/dev/null 2>&1

echo
set +e
cd ..
echo "#                 scripts installed successfully            #"
exit 