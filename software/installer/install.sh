#!/bin/sh

INSTALLER_BUILD=2
CURRENT_BUILD=0
BUILD_NUMBER_FILE=/usr/share/fibstack/.build

abort_with_message()
{
    if [ $1 -ne 0 ]; then
        echo "$2. Aborting..."
        exit 1
    fi
}

install_current_version()
{
   
    # Enable I2C
    IS_I2C_ENABLED=`raspi-config nonint get_i2c`
    if [ $IS_I2C_ENABLED -ne 0 ]; then
       raspi-config nonint do_i2c 0
       abort_with_message $? "Could not enable I2C"
    fi
    
    # Compile C library
    cd fibstackcli && make
    abort_with_message $? "Could not compile Fibstack C library"
    cd ..
    
    # Install required library python3-cffi
    PYCFFI_INFO=`dpkg-query -l | grep -w "python3-cffi "`
    if [ -z "$PYCFFI_INFO" ]; then
        apt -y install python3-cffi
        abort_with_message $? "Could not install python3-cffi"
    fi
    
    # Install pip3 if doesn't exist
    LIBPIP_INFO=`dpkg-query -l | grep python3-pip`
    if [ -z "$LIBPIP_INFO" ]; then
        apt -y install python3-pip
    fi
    
    # Install Python libraries
    pip3 install flask
    pip3 install flask-cors
    
    # Compile Python CFFI library
    cd fibstacklib_cffi && python3 fibstacklib_cffi_build.py
    abort_with_message $? "Could not compile CFFI Python library"
    cd ..
    
    # Copy fibstack folder
    cp -r fibstack/ /usr/share/
    chmod 511 /usr/share/fibstack/webapp.py
    chmod 511 /usr/share/fibstack/uninstall.sh
    
    # Copy C library files
    cp libfibstack/fibstack.h /usr/include/
    cp fibstackcli/libfibstack.so /usr/lib/
    chmod 644 /usr/include/fibstack.h
    chmod 755 /usr/lib/libfibstack.so
    ldconfig
    
    # Copy Fibstack CLI utility
    cp fibstackcli/fibstack /usr/bin/
    chmod 511 /usr/bin/fibstack
    
    # Copy Python library folder
    cp -r fibstacklibpy/ /usr/lib/python3/dist-packages/
    chmod -R 755 /usr/lib/python3/dist-packages/fibstacklibpy
    
    # Copy CFFI Python library
    cp fibstacklib_cffi/fibstacklib_*.so /usr/lib/python3/dist-packages/
    chmod 644 /usr/lib/python3/dist-packages/fibstacklib_*.so
    
    # Copy the service file
    cp fibstack.service /usr/lib/systemd/system/
    
    # Enable and start the service
    systemctl enable fibstack.service
    systemctl start fibstack.service
    
    echo "Fibstack package installation complete."
}

uninstall_old_version()
{
    echo "Uninstalling old version."
    # Call current uninstall.sh script
    /usr/share/fibstack/uninstall.sh
    abort_with_message $? "Could not uninstall old version."
}

# Check if root
if [ `id -u` -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

if [ -f $BUILD_NUMBER_FILE ]; then
    CURRENT_BUILD=`cat $BUILD_NUMBER_FILE`
fi

if [ $CURRENT_BUILD -eq $INSTALLER_BUILD ]; then
    # Case when the same version is installed already
    echo "You have already current version installed. Nothing to do"
    
elif [ $CURRENT_BUILD -gt $INSTALLER_BUILD ]; then
    # Greater version is installed, ask user to uninstall it manually if he wish
    echo "A newer version is installed already. If you wish to install this old version, please uninstall the new version manually."
    
elif [ $CURRENT_BUILD -lt $INSTALLER_BUILD ]; then
    
    UNINSTALL_RESULT=0
    if [ $CURRENT_BUILD -gt 0 ]; then
        
        # Ask the user if he wants to uninstall the old version and install the new one.
        while true; do
            read -p "An older version of Fibstack package is installed. Do you want to uninstall it? [Y/n]" USER_ANSWER
            case ${USER_ANSWER:-Y} in
                [Yy]* ) 
                        uninstall_old_version
                        UNINSTALL_RESULT=$?
                        break
                        ;;
                [Nn]* )
                        exit
                        ;;
                * )     echo "Please answer Y or N.";;
            esac
        done
    fi
    
    if [ $UNINSTALL_RESULT -eq 0 ]; then
        install_current_version
    else
        echo "Could not uninstall the old version. Please uninstall the old version manually and try to run this installer again."
    fi

else
    install_current_version
fi
