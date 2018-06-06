#!/bin/bash
. ./env_rpi.sh

apt-get install -y git-core build-essential qt5-default libqt5serialport5-dev qtdeclarative5-dev libqt5qml5 libqt5quick5 qtbase5-dev-tools qttools5-dev-tools libfontconfig1-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libwayland-dev lib32z1

git clone https://github.com/raspberrypi/tools.git --depth=1
git clone https://github.com/raspberrypi/firmware.git --depth=1

mkdir -p $OUTPUT_PATH
mkdir -p $HOST_QT_PATH

cp -a firmware/opt $TOOLS_PATH/sysroot

git clone git://code.qt.io/qt/qtbase.git -b $QTRPI_QT_VERSION
pushd qtbase
./configure -release -opengl es2 -device $QTRPI_TARGET_DEVICE \
-device-option CROSS_COMPILE=$CROSS_COMPILE_PATH -sysroot $RPI_SYSROOT \
-opensource -confirm-license -make libs -prefix $DEPLOY_PATH/qt5pi \
-hostprefix $HOST_QT_PATH -extprefix $OUTPUT_PATH -v -no-use-gold-linker \
-optimized-qmake -reduce-exports -make libs

make -j$(nproc)
make install
popd

git clone git://code.qt.io/qt/qtdeclarative.git -b $QTRPI_QT_VERSION
pushd qtdeclarative
$RPI_CROSS_COMPILER . 
make -j$(nproc)
make install
popd

git clone git://code.qt.io/qt/qtserialport.git -b $QTRPI_QT_VERSION
pushd qtserialport
$RPI_CROSS_COMPILER . 
make -j$(nproc)
make install
popd

mkdir -p $BUILD_DIR
mkdir -p $RELEASE_DIR

pushd $BUILD_DIR
$RPI_CROSS_COMPILER -r $DIR/sam-ba.pro
make INSTALL_ROOT=$RELEASE_DIR -j$(nproc) install
popd

cat ./deploy_rpi.sh | ssh $PI_USERNAME@$PI_HOSTNAME

rsync -avz $OUTPUT_PATH $PI_USERNAME@$PI_HOSTNAME:$DEPLOY_PATH
rsync -rvL $RELEASE_DIR/ $PI_USERNAME@$PI_HOSTNAME:$PI_INSTALL_DIR

ssh $PI_USERNAME@$PI_HOSTNAME 'sudo ldconfig'
