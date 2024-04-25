FROM osrf/ros:humble-desktop-full

RUN apt-get update \
 && apt-get install -y \
      libatlas-base-dev  libgoogle-glog-dev libsuitesparse-dev wget unzip python3-pip \
      ros-humble-pcl-conversions ros-humble-rviz2 ros-humble-image-transport \
      ros-humble-image-transport-plugins ros-humble-pcl-ros \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Livox-SDK/Livox-SDK2.git /Livox-SDK2 \
 && cd /Livox-SDK2 && mkdir build && cd build \
 && cmake .. && make -j install \
 && rm -fr /Livox-SDK2

