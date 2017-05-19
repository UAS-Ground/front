#!/bin/bash


sudo echo "Root permission obtained..."
PROJECT_ROOT_DIR=$(pwd)
cd ROSCamera/build-desktop
$HOME/Qt/5.8/gcc_64/bin/qmake ..
make
sudo make install

cd $PROJECT_ROOT_DIR
mkdir build
cd build
$HOME/Qt/5.8/gcc_64/bin/qmake ../src
make
cd $PROJECT_ROOT_DIR
echo "Ground System client build complete. Binary executable located in 'build' directory."
