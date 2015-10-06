# AVR Avreal Ubuntu flashing brief guide

Download **avrealxx** binary file and rename it to **avreal**
Download **ftdi** lib and unpack it

```bash
sudo bash
cd ftdi-dir/release/build
ln -s libftd2xx.so.1.3.6 libftd2xx.so.0
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
cd
rmmod ftdi_sio
```
now we can run avreal (for example for mega8 and my first home-made adapter)
```bash
./avreal +ATmega8 -aft2232:enable=adbus4 -pd="Dual RS232 A" -r test.hex
```
More conviement way is to use [avreal.sh](https://github.com/Helius/avreal-ftdi-programmer-using/blob/master/avreal.sh). 

Just run this script as root user like original avreal, it prepares enviroment for you and runs suitable binary with libs.


repo contains: 
avreal/Linux64 v1.29r0 (Dec 11 2013 19:45:35)
avreal/Linux32 v1.29r0 (Dec 11 2013 19:45:35)
libftd2xx.so.1.3.6 for x86 and x64 archs

