ln -s libftd2xx.so.1.3.6 libftd2xx.so.0 2>/dev/null
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
rmmod ftdi_sio 2>/dev/null
./avreal64-1.29r0 "$@"
