##wget https://raw.githubusercontent.com/join93/feed/main/extensions/raedquicksingnal-es.sh -O - | /bin/sh##

version=16.2

cd /tmp
set -e

wget --no-check-certificate https://raw.githubusercontent.com/join93/feed/main/extensions/raedquicksignal-"$version".tar.gz
tar -xzf raedquicksignal-"$version".tar.gz -C /

rm -rf *raedquicksignal-"$version".tar.gz* >/dev/null 2>&1

echo
set +e


cd ..
echo "#                 RaedQuickSignal-"$version" installed successfully            #"
exit 