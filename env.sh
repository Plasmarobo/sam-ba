#!/bin/bash

export DIR=$(pwd)
export SRC_DIR=$DIR/src
export BUILD_DIR=$DIR/build
export RELEASE_DIR=$DIR/bin

export CROSS_COMPILER=/opt/qtrpi/bin/qmake-qtrpi

export PI_INSTALL_DIR=/home/pi/flash/sam-ba/
export PI_HOSTNAME=austenflasher.local
export PI_USERNAME=pi


export QTRPI_QT_VERSION='5.7.0'
export QTRPI_TARGET_DEVICE='linux-rpi3-g++'
export QTRPI_TARGET_HOST="$PI_USERNAME@$PI_HOSTNAME"

