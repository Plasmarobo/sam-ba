#!/bin/bash
. ./env.sh

apt-get install -y git-core build-essential qt5-default libqt5serialport5-dev qtdeclarative5-dev libqt5qml5 libqt5quick5 build-essential qtbase5-dev-tools qttools5-dev-tools

mkdir -p $QTRPI_DIR
pushd $QTRPI_DIR
git clone https://github.com/neuronalmotion/qtrpi.git $QTRPI_DIR
./init-qtrpi-minimal.sh
./deploy-qtripi.sh --prepare-rpi
popd

mkdir -p $BUILD_DIR
mkdir -p $RELEASE_DIR

pushd $BUILD_DIR
$CROSS_COMPILER -r $DIR/sam-ba.pro
make INSTALL_ROOT=$RELEASE_DIR install
popd

rsync -rvL $RELEASE_DIR/ $PI_USERNAME@$PI_HOSTNAME:$PI_INSTALL_DIR

