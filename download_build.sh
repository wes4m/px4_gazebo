#!/bin/bash

# Download
wget https://bitbucket.org/unCoderSc/px4-modified/raw/1ec3ea229f7043124bdd5f9db0eb7640ca0e4718/firmware.tar.gz

# decompress
tar -xvf firmware.tar.gz

# Create command for running fuzz_input
echo "fuzz_input" > firmware/fuzzing-tools/iris

# Create input pipe FIFO file
rm firmware/fuzzing-tools/pipe
mkfifo firmware/fuzzing-tools/pipe

# build image
docker build . -t px4_gazebo_image

