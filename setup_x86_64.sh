#!/bin/bash
. ./env_x86_64.sh

apt-get install -y git-core build-essential qt5-default libqt5serialport5-dev qtdeclarative5-dev libqt5qml5 libqt5quick5 build-essential qtbase5-dev-tools qttools5-dev-tools

mkdir -p $BUILD_DIR
mkdir -p $RELEASE_DIR

pushd $BUILD_DIR
qmake -r $DIR/sam-ba.pro
make INSTALL_ROOT=$RELEASE_DIR install
popd

