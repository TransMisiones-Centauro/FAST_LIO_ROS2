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

RUN mkdir -p /ros2_ws/src

RUN git clone --recurse-submodules \
      https://github.com/TransMisiones-Centauro/FAST_LIO_ROS2.git \
      /ros2_ws/src

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
 && cd /ros2_ws/src/livox_ros_driver2 \
 && ./build.sh humble

