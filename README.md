# AVR Avreal Ubuntu flashing brief guide

Latest version of avreal and libftdi you can download here:<br>
[avreal](http://real.kiev.ua/avreal/download/)<br>
[libftdixx](http://www.ftdichip.com/Drivers/D2XX.htm)<br>

Now create symlink to ftdixx lib, because **aveal** found it as **libftd2xx.so.0**
```bash
ln -s libftd2xx.so.1.3.6 libftd2xx.so.0
```
Unload **ftdi_sio** module because it doesn't give us work with ftdi chip
```bash
rmmod ftdi_sio
```
Export library path
```bash
export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH
```

Wrapper
--------

More conviement way is to use [avreal.sh](https://github.com/Helius/avreal-ftdi-programmer-using/blob/master/avreal.sh). 

Just run this wrapper as root user like original avreal, it prepares enviroment for you and runs suitable binary with libs.

now we can flash (for example for mega8 and my first home-made adapter on FT2232 and for schematic with inverted adbus4 in ft2232-prog-doc)
```bash
./avreal.sh +ATmega8 -aft2232:enable=~adbus4 -pd="Dual RS232 A" -r test.hex
```
Examples
--------
Eraise, write, verify flash **main.hex**
```bash
./avreal.sh +ATmega8 -aft2232:enable=~adbus4 -pd="Dual RS232 A" -e -w -v -c main.hex
```
Write main.hext to Arduino pro mini
```bash
./avreal.sh +ATmega328P -aft2232:enable=~adbus4 -pd="Dual RS232 A" -e -w -v -c main.hex
```

Fuses
--------
Fuse list for Atmega8 chip
```bash
./avreal.sh +Atmega8 -?
```
Read fuse bits
```bash
./avreal.sh +ATmega8 -aft2232:enable=~adbus4 -pd="Dual RS232 A" -f
```
Select internal RC oscillator with 8 MHz
```bash
./avreal.sh +ATmega8 -aft2232:enable=~adbus4 -pd="Dual RS232 A" -f CKSEL=4 -w
```
For external high speed oscillator CKSEL=F




repo contains:<br>
avreal/Linux64 v1.29r0 (Dec 11 2013 19:45:35)<br>
avreal/Linux32 v1.29r0 (Dec 11 2013 19:45:35)<br>
libftd2xx.so.1.3.6 for x86 and x64 archs<br>

