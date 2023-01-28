##wget https://raw.githubusercontent.com/join93/feed/main/extensions/dreamsat-dev.sh -O - | /bin/sh##

VERSION=1.5
PLUGIN_PATH='/usr/lib/enigma2/python/Plugins/Extensions/DreamSat'
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")

if [ -f /etc/apt/apt.conf ] ; then
    STATUS='/var/lib/dpkg/status'
    OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ] ; then
   STATUS='/var/lib/opkg/status'
   OS='Opensource'
fi

# remove old version
# rm -f /var/etc/.stcpch.cfg > /dev/null 2>&1
# rm -rf /usr/local/chktools > /dev/null 2>&1
if [ /media/ba/DreamSat ]; then
    rm -rf /media/ba/DreamSat > /dev/null 2>&1
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/DreamSat > /dev/null 2>&1
else
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/DreamSat > /dev/null 2>&1
fi

if [ -d $PLUGIN_PATH ]; then

   rm -rf $PLUGIN_PATH
  
fi

if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 -o "$PYTHON_VERSION" == 3.9.6 -o "$PYTHON_VERSION" == 3.8.5 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHON='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'
elif [ "$PYTHON_VERSION" == 3.10.4 -o "$PYTHON_VERSION" == 3.10.6 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHONLAST='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHONLASTV='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'        
else
    echo ":You have $PYTHON_VERSION image ..."
    PYTHON='PY2'
    IMAGING='python-imaging'
    PYSIX='python-six'
fi

if grep -q $IMAGING $STATUS; then
    imaging='Installed'
fi

if grep -q $PYSIX $STATUS; then
    six='Installed'
fi

if [ "$imaging" = "Installed" -a "$six" = "Installed" ]; then
     echo "All dependecies are installed"
else

    if [ $OS = "Opensource" ]; then
        echo "=========================================================================="
        echo "Some Depends Need to Be downloaded From Feeds ...."
        echo "=========================================================================="
        echo "Opkg Update ..."
        echo "========================================================================"
        opkg update
        echo "========================================================================"
        echo " Downloading $IMAGING , $PYSIX ......"
        opkg install $IMAGING
        echo "========================================================================"
        opkg install $PYSIX
        echo "========================================================================"
    else
        echo "=========================================================================="
        echo "Some Depends Need to Be downloaded From Feeds ...."
        echo "=========================================================================="
        echo "apt Update ..."
        echo "========================================================================"
        apt-get update
        echo "========================================================================"
        echo " Downloading $IMAGING , $PYSIX ......"
        apt-get install $IMAGING -y
        echo "========================================================================"
        apt-get install $PYSIX -y
        echo "========================================================================"
    fi


fi

if grep -q $IMAGING $STATUS; then
    echo ""
else
    echo "#########################################################"
    echo "#       $IMAGING Not found in feed                      #"
    echo "#########################################################"
fi

if grep -q $PYSIX $STATUS; then
    echo ""
else
    echo "#########################################################"
    echo "#       $PYSIX Not found in feed                        #"
    echo "#########################################################"
    exit 1
fi

CHECK='/tmp/check'
uname -m > $CHECK
sleep 1;
if grep -qs -i 'mips' cat $CHECK ; then
    echo "[ Your device is MIPS ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py3-mipsel.tar.gz -O /tmp/dreamsat$VERSION-py3-mipsel.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py3-mipsel.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py3-mipsel.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
        if [ ! -f '/usr/lib/libpython3.7m.so.1.0' ];then
            wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/libpython3.7-mipsel.tar.gz -O /tmp/libpython3.7-mipsel.tar.gz
            tar -xzf /tmp/libpython3.7-mipsel.tar.gz -C /
            rm -f /tmp/libpython3.7-mipsel.tar.gz
            chmod 0775 /usr/lib/libpython3.7m.so.1.0
            echo "Send libpython3.7m"
        fi
    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-mips-3.10.tar.gz -O /tmp/DreamSat-Panel_$VERSION-mips-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-mips-3.10.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-mips-3.10.tar.gz
    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_1.5-mips-3.11.tar.gz -O /tmp/DreamSat-Panel_1.5-mips-3.11.tar.gz
        tar -xzf /tmp/DreamSat-Panel_1.5-mips-3.11.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_1.5-mips-3.11.tar.gz    
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py2-mipsel.tar.gz -O /tmp/dreamsat$VERSION-py2-mipsel.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py2-mipsel.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py2-mipsel.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
    fi
elif grep -qs -i 'armv7l' cat $CHECK ; then
    echo "[ Your device is armv7l ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-arm-3.9.tar.gz -O /tmp/DreamSat-Panel_$VERSION-arm-3.9.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-arm-3.9.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-arm-3.9.tar.gz
        
    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-arm-3.10.tar.gz -O /tmp/DreamSat-Panel_$VERSION-arm-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-arm-3.10.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-arm-3.10.tar.gz
    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_1.5-arm-3.11.tar.gz -O /tmp/DreamSat-Panel_1.5-arm-3.11.tar.gz
        tar -xzf /tmp/DreamSat-Panel_1.5-arm-3.11.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_1.5-arm-3.11.tar.gz    
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py2-arm.tar.gz -O /tmp/dreamsat$VERSION-py2-arm.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py2-arm.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py2-arm.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
    fi
    
elif grep -qs -i 'aarch64' cat $CHECK ; then
    echo "[ Your device is aarch64 ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py3-aarch64.tar.gz -O /tmp/dreamsat$VERSION-py3-aarch64.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py3-aarch64.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py3-aarch64.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
        if [ ! -f '/usr/lib/libpython3.7m.so.1.0' ];then
            wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/libpython3.7-aarch64.tar.gz -O /tmp/libpython3.7-aarch64.tar.gz
            tar -xzf /tmp/libpython3.7-aarch64.tar.gz -C /
            rm -f /tmp/libpython3.7-aarch64.tar.gz
            chmod 0775 /usr/lib/libpython3.7m.so.1.0
            echo "Send libpython3.7m"
        fi
    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-py-3.10.tar.gz -O /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz -O /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz    
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py2-aarch64.tar.gz -O /tmp/dreamsat$VERSION-py2-aarch64.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py2-aarch64.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py2-aarch64.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
    fi
    
elif grep -qs -i 'sh4' cat $CHECK ; then
    echo "[ Your device is sh4 ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py3-sh4.tar.gz -O /tmp/dreamsat$VERSION-py3-sh4.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py3-sh4.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py3-sh4.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
        if [ ! -f '/usr/lib/libpython3.7m.so.1.0' ];then
            wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/libpython3.7-sh4.tar.gz -O /tmp/libpython3.7-sh4.tar.gz
            tar -xzf /tmp/libpython3.7-sh4.tar.gz -C /
            rm -f /tmp/libpython3.7-sh4.tar.gz
            chmod 0775 /usr/lib/libpython3.7m.so.1.0
            echo "Send libpython3.7m"
        fi
    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-py-3.10.tar.gz -O /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz -O /tmp/DreamSat-Panel_$VERSION-py-3.10.tar.gz
        tar -xzf /tmp/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz -C /
        rm -f /tmp/DreamSat-Panel_$VERSION-py-3.10.6.tar.gz    
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/dreamsat/main/dreamsat$VERSION-py2-sh4.tar.gz -O /tmp/dreamsat$VERSION-py2-sh4.tar.gz
        tar -xzf /tmp/dreamsat$VERSION-py2-sh4.tar.gz -C /
        rm -f /tmp/dreamsat$VERSION-py2-sh4.tar.gz
        chmod 0775 $PLUGIN_PATH/ui/*.so
        chmod 0775 $PLUGIN_PATH/core/*.so
    fi
else
    echo "Your device is not supported"
    exit 1
fi

## This commands to save plugin from BA protection
if [ $OS = 'DreamOS' ]; then
    if [ "/media/ba" -a "/usr/lib/enigma2/python/Plugins/Extensions/DreamSat" ]; then
        mv /usr/lib/enigma2/python/Plugins/Extensions/DreamSat /media/ba
        ln -s /media/ba/DreamSat /usr/lib/enigma2/python/Plugins/Extensions
    fi
fi

echo "#                 dreamsat panel-"$VERSION" installed successfully            #"

sleep 2

exit
