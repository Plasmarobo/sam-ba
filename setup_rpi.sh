#!/bin/bash
. ./env_rpi.sh

apt-get install -y git-core build-essential qt5-default libqt5serialport5-dev qtdeclarative5-dev libqt5qml5 libqt5quick5 qtbase5-dev-tools qttools5-dev-tools libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libwayland-dev lib32z1

git clone https://github.com/raspberrypi/tools.git --depth=1
git clone https://github.com/raspberrypi/firmware.git --depth=1

#TOOLCHAIN=arm-linux-gnueabihf
TOOLCHAIN=gcc-linaro-arm-linux-gnueabihf-raspbian-x64
CROSS_COMPILE_PATH=$PWD/tools/arm-bcm2708/$TOOLCHAIN/bin/arm-linux-gnueabihf-
TOOLS_PATH=$PWD/tools/arm-bcm2708/$TOOLCHAIN/arm-linux-gnueabihf
OUTPUT_PATH=$PWD/qt5pi
HOST_QT_PATH=$PWD/qt5

#wget -nc https://raw.githubusercontent.com/riscv/riscv-poky/priv-1.10/scripts/sysroot-relativelinks.py
#chmod +x sysroot-relativelinks.py
#./sysroot-relativelinks.py $TOOLS_PATH/sysroot

RPI_SYSROOT=$PWD/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot

mkdir -p $OUTPUT_PATH
mkdir -p $HOST_QT_PATH

cp -a firmware/opt $TOOLS_PATH/sysroot

git clone git://code.qt.io/qt/qtbase.git -b $QTRPI_QT_VERSION
pushd qtbase
./configure -release -opengl es2 -device $QTRPI_TARGET_DEVICE \
-device-option CROSS_COMPILE=$CROSS_COMPILE_PATH -sysroot $RPI_SYSROOT \
-opensource -confirm-license -make libs -prefix /usr/local/qt5pi \
-hostprefix $HOST_QT_PATH -extprefix $OUTPUT_PATH -v -no-use-gold-linker -nomake tests

make -j$(nproc)
make install
popd

export RPI_CROSS_COMPILER=$PWD/qtbase/qmake/qmake

git clone git://code.qt.io/qt/qtdeclarative.git
pushd qtdeclarative
$RPI_CROSS_COMPILER . 
make -j$(nproc) -skip tests
make install
popd

git clone git://code.qt.io/qt/qtserialport.git
pushd qtserialport
$RPI_CROSS_COMPILER . 
make -j$(nproc) -skip tests
make install
popd

export QML2_IMPORT_PATH=$PWD/qt5/

mkdir -p $BUILD_DIR
mkdir -p $RELEASE_DIR

pushd $BUILD_DIR
$RPI_CROSS_COMPILER -r $DIR/sam-ba.pro
make INSTALL_ROOT=$RELEASE_DIR -j$(nproc) install
popd

rsync -rvL $OUTPUT_PATH $PI_USERNAME@$PI_HOSTNAME:/usr/local/qt5pi
rsync -rvL $RELEASE_DIR/ $PI_USERNAME@$PI_HOSTNAME:$PI_INSTALL_DIR

