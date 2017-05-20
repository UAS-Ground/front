#!/bin/bash
# Install OpenCV
INITIAL_DIR=$(pwd)
cd $HOME
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
echo "UAS Installation: OpenCV dependencies complete"
git clone https://github.com/opencv/opencv.git
cd opencv
ls
cd $INITIAL_DIR
echo "UAS Installation: OpenCV install script complete"

