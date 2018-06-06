#!/bin/bash
PI_USERNAME=pi
sudo mkdir /usr/local/qt5pi ; sudo chown -R ${PI_USERNAME}:users /usr/local/qt5pi
sudo apt-get install -y apt-transport-https
sudo apt-get install -y libts-0.0-0 libinput5 fontconfig
sudo sh -c 'echo /usr/local/qt5pi/lib > /etc/ld.so.conf.d/99-qt5pi.conf'

sudo sh -c 'rm /usr/lib/arm-linux-gnueabihf/libEGL.so.1.0.0 /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.0.0'
sudo sh -c 'ln -sf /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1.0.0'
sudo sh -c 'ln -sf /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1'
sudo sh -c 'ln -sf /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2.0.0'
sudo sh -c 'ln -sf /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2'

