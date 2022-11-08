
# Check if root
if [ `id -u` -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

echo "Uninstalling the FibStack package..."


# Stop and disable the service
# Remove the service file
FIBSTACK_SERVICE_FILE=/usr/lib/systemd/system/fibstack.service
if [ -f $FIBSTACK_SERVICE_FILE ]; then
    systemctl stop fibstack.service
    systemctl disable fibstack.service
    rm $FIBSTACK_SERVICE_FILE
fi

# Remove the Python library
PYTHON_LIB_DIR=/usr/lib/python3/dist-packages/fibstacklibpy
[ -d $PYTHON_LIB_DIR ] && rm -rf $PYTHON_LIB_DIR

# Remove CFFI Python library
PYTHON_CFFI_LIB_FILE=/usr/lib/python3/dist-packages/fibstacklib_*.so
[ -f $PYTHON_CFFI_LIB_FILE ] && rm $PYTHON_CFFI_LIB_FILE

# Remove FibStack CLI utility
FIBSTACK_CLI_FILE=/usr/bin/fibstack
[ -f $FIBSTACK_CLI_FILE ] && rm $FIBSTACK_CLI_FILE

# Remove C library files
FIBSTACK_C_HEADER=/usr/include/fibstack.h
FIBSTACK_C_LIB=/usr/lib/fibstacklib.so
[ -f $FIBSTACK_C_HEADER ] && rm $FIBSTACK_C_HEADER
[ -f $FIBSTACK_C_LIB ] && rm $FIBSTACK_C_LIB

# Remove fibstack folder recursively
FIBSTACK_DIR=/usr/share/fibstack
[ -d $FIBSTACK_DIR ] && rm -r $FIBSTACK_DIR

echo "FibStack package was uninstalled."
