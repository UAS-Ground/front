#!/bin/bash

sudo echo "Root permission obtained."
./scripts/install_ros.sh
./scripts/install_opencv.sh
./scripts/install_qt.sh

echo "Ground System dependencies installed"