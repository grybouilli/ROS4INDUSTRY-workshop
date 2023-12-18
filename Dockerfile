FROM osrf/ros:noetic-desktop-full as grybouros
RUN echo source /opt/ros/noetic/setup.bash >> ./root/.bashrc
RUN echo ulimit -n 65536 >> ./root/.bashrc
EXPOSE 8665
ENV DISPLAY :0
ENTRYPOINT [ "/bin/bash" ]
