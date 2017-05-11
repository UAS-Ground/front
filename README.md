# Installation

These instructions assume you are running Ubuntu 16.04. If you'd like to develop on a newer version of Ubuntu, you will have to install the corresponding version of ROS, as ROS Kinetic depends of Ubuntu 16.04. 

## Methods of installation
1. Use install script

Or
2. Install dependencies individually
---

### Method 1: Use install script
---

#### Navigate to home directory
```bash
cd $HOME
```

#### Clone UAS Ground System repository
```bash
git clone https://github.com/UAS-Ground/ground-system
```
#### Navigate to UAS Ground System root directory
```bash
cd ground-system
```

#### Execute install script
```bash
chmod +x install.sh
./install.sh
```
---

### Method 2: 
---

#### Prepare to use package manager

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
```
Enter your password and confirm installation when prompted


#### Install ROS Kinetic

Follow instructions at [ROS Kinetic Ubuntu installation page](http://wiki.ros.org/kinetic/Installation/Ubuntu)

#### Install Google Protocol Buffers

#### Install Boost

#### Install OpenCV

#### Install Qt 5.8
