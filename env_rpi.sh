#!/bin/bash

export DIR=$(pwd)
export BUILD_DIR=$DIR/rpi_build
export RELEASE_DIR=$DIR/rpi_bin

export PI_INSTALL_DIR=/home/pi/flash/sam-ba/
export PI_HOSTNAME=austenflasher.local
export PI_USERNAME=pi

export QTRPI_QT_VERSION=5.10
export QTRPI_TARGET_DEVICE=linux-rasp-pi3-g++
export QTRPI_TARGET_HOST="$PI_USERNAME@$PI_HOSTNAME"

export TOOL_ROOT=$PWD/tools/arm-bcm2708
export TOOLCHAIN=gcc-linaro-arm-linux-gnueabihf-raspbian-x64
export CROSS_COMPILE_PATH=$TOOL_ROOT/$TOOLCHAIN/bin/arm-linux-gnueabihf-
export TOOLS_PATH=$TOOL_ROOT/$TOOLCHAIN/arm-linux-gnueabihf
export OUTPUT_PATH=$PWD/qt5pi
export HOST_QT_PATH=$PWD/qt5
export DEPLOY_PATH=/usr/local/
export RPI_SYSROOT=$TOOL_ROOT/arm-rpi-4.9.3-linux-gnueabihf/arm-linux-gnueabihf/sysroot
export RPI_CROSS_COMPILER=$PWD/qtbase/qmake/qmake
export QML2_IMPORT_PATH=$PWD/qt5/

