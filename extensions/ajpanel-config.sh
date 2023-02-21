#checking and installing ajpanel 

if [ ! -d "/usr/lib/enigma2/python/Plugins/Extensions/AJPan" ]; then
wget https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-es.sh -O - | /bin/sh
fi
#download ajpanel settings and folder


echo ""
cd /tmp
set -e
wget -O ajpanel-folder.tar.gz "https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-folder.tar.gz"

wget -O ajpanel-settings.tar.gz "https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-settings.tar.gz"

wget -O ajpanel-ar.tar.gz "https://raw.githubusercontent.com/join93/feed/main/extensions/ajpanel-ar.tar.gz"

tar -xzf ajpanel-folder.tar.gz -C /
tar -xzf ajpanel-settings.tar.gz -C /
tar -xzf ajpanel-ar.tar.gz -C /
set +e
rm -f ajpanel-folder.tar.gz
rm -f ajpanel-settings.tar.gz
rm -f ajpanel-ar.tar.gz

echo''
if [ -d "/ajpanel" ]; then wget -O /ajpanel/LinuxCommands-openpli.lst "https://raw.githubusercontent.com/join93/feed/main/settings/LinuxCommands-openpli.lst"
fi

init 4; sleep 5

BACKUP='/tmp/settingsajpanel'
SETTINGS='/etc/enigma2/settings'

cat $BACKUP >> $SETTINGS
rm -f $BACKUP
   
init 3
echo " "
exit

