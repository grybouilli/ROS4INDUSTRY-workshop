#!/bin/bash

# docker run -it --rm ros:noetic-ros-base
xhost +local:
echo xhost local

echo running docker ...
docker run --net=host --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $HOME/Cours/3A/formation_ros:/mnt --privileged -e ROS_MASTER_URI=http://10.99.99.1:11311 -it grybouros4pro

# run following inside docker : source /opt/ros/noetic/setup.bash