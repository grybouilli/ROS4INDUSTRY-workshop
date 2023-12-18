#!/bin/bash

# docker run -it --rm ros:noetic-ros-base
xhost +local:
echo xhost local

echo running docker ...
docker run -p "8565:8565" --gpus all --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $HOME/Cours/3A/formation_ros:/mnt --privileged -it grybouros 
echo docker run

# run following inside docker : source /opt/ros/noetic/setup.bash