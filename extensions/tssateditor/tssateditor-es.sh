
#!/bin/sh

## ✅️SCRIPT :wget -q "--no-check-certificate" https://raw.githubusercontent.com/join93/feed/main/extensions/tssateditor/tssateditor-py2-es.sh -O - | /bin/sh

##########################################
version=2.0
#############################################################
PYTHON_VERSION=$(python -c"import sys; print(sys.version_info.major)") 

if [ "$PYTHON_VERSION" -eq 3 ]; then

wget -q "--no-check-certificate" https://raw.githubusercontent.com/join93/feed/main/extensions/tssateditor/tssateditor-py3-es.sh -O - | /bin/sh

else

TEMPATH=/tmp

OPKGINSTALL="opkg install --force-overwrite"

MY_PACK=TSsatEditor

MY_IPK="TSsatEditor-py2.ipk"

MY_URL="https://raw.githubusercontent.com/join93/feed/main/extensions/tssateditor"


# remove old version #
rm -rf /usr/lib/enigma2/python/Plugins/SystemPlugins/TSsatEditor
opkg remove enigma2-plugin-extensions-ts-sateditor

echo "#                 downloading   "$MY_PACK"-"$version" please wait...           #"
# Download and install plugin
cd /tmp
set -e
     wget -q "$MY_URL/$MY_IPK"

		$OPKGINSTALL $MY_IPK
echo "================================="
set +e
cd ..
wait
rm -f /tmp/$MY_IPK

	if [ $? -eq 0 ]; then
echo "#                 "$MY_PACK"-"$version" installed successfully            #"
fi
fi

exit 0