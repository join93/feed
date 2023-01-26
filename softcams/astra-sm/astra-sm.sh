echo " Installing Astra-Sm Please Wait... " 
cd /tmp
set -e
wget "https://raw.githubusercontent.com/join93/feed/main/softcams/astra-sm/astra-sm.tar.gz"
tar -xzf astra-sm.tar.gz -C /
set +e
rm -f astra-sm.tar.gz
wait
opkg install --force-overwrite https://raw.githubusercontent.com/join93/feed/main/softcams/astra-sm/astra-sm.ipk
wait
sleep 2;
exit 0


































