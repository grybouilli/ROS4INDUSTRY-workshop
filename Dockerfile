FROM osrf/ros:noetic-desktop-full as gryboubash
RUN echo . /opt/ros/noetic/setup.bash >> ./root/.bashrc

FROM gryboubash as gryboupop
WORKDIR /
RUN mkdir catkin_ws && cd catkin_ws && mkdir src && cd src 

FROM gryboupop as gryboupop2
WORKDIR /catkin_ws/src
RUN apt update -y && apt install git -y
RUN git clone https://github.com/poppy-project/poppy_controllers
RUN git clone https://github.com/poppy-project/poppy_ergo_jr_description.git
RUN git clone https://github.com/poppy-project/poppy_ergo_jr_moveit_config.git
RUN apt install liburdfdom-tools -y

FROM gryboupop2 as gryboupop3
WORKDIR /
RUN echo "cd /catkin_ws && catkin_make" >> /root/.bashrc
RUN echo source /catkin_ws/devel/setup.bash >> /root/.bashrc

FROM gryboupop3 as grybouros
RUN echo ulimit -n 65536 >> ./root/.bashrc
EXPOSE 8665
ENV DISPLAY :0
ENV RMW_IMPLEMENTATION "rmw_cyclonedds_cpp"
ENV ROS_DOMAIN_ID 0
ENV TZ "Europe/Paris"
ENTRYPOINT [ "/bin/bash" ]