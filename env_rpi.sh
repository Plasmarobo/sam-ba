#!/bin/bash

export DIR=$(pwd)
export SRC_DIR=$DIR/src
export BUILD_DIR=$DIR/rpi_build
export RELEASE_DIR=$DIR/rpi_bin

export CROSS_COMPILER=/opt/qtrpi/bin/qmake-qtrpi
# For x86_64 this should be set to /usr/lib/x86_64/qt5/qml
# Otherwise to the QTPI directory
export QML2_IMPORT_PATH=/opt/qtrpi/raspi/qt5pi/qml

export PI_INSTALL_DIR=/home/pi/flash/sam-ba/
export PI_HOSTNAME=austenflasher.local
export PI_USERNAME=pi


export QTRPI_QT_VERSION=5.10
export QTRPI_TARGET_DEVICE=linux-rasp-pi3-g++
export QTRPI_TARGET_HOST="$PI_USERNAME@$PI_HOSTNAME"

