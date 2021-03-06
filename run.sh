#!/bin/bash


# for gazebo GUI (not neccessary)
xhost +

# Kill check
docker stop px4_gazebo
docker rm px4_gazebo

# run inside container
docker run -it --privileged \
    -v $(pwd)/firmware:/firmware:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=:0 \
    -p 14556:14556/udp \
    --name=px4_gazebo px4_gazebo_image
#    --name=px4_gazebo px4_gazebo_image "bash"
