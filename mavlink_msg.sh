#!/bin/bash
# Sends message to px4 fuzz_input.c through FIFO pipe. Then fuzz_input.c orb_advertise the msg to mavlink_sim

echo $1 > firmware/fuzzing-tools/pipe

