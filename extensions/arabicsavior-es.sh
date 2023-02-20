##wget https://raw.githubusercontent.com/join93/feed/main/extensions/arabicsavior-es.sh -O - | /bin/sh##

version=2.1


cd /tmp
rm -f *arabicsavior*
# Download new version
wget "https://raw.githubusercontent.com/join93/feed/main/extensions/arabicsavior-"$version".tar.gz"

# remove old version
rm -r /usr/lib/enigma2/python/Plugins/Extensions/ArabicSavior > /dev/null 2>&1

# Install new version
tar -xzf arabicsavior-"$version".tar.gz -C /
set +e
rm -f *arabicsavior*
cd ..

sync
echo ""#                 arabicsavior-"$version" installed successfully            #""

sleep 3
exit 0















































