#!/bin/bash

export UAV_PATH=$(pwd)
rm -rf $UAV_PATH/OpenCVPlugin/build-desktop
cd $UAV_PATH/OpenCVPlugin
mkdir build-desktop
cd build-desktop
$HOME/Qt/5.8/gcc_64/bin/qmake ..
make -j 5
sudo make install

