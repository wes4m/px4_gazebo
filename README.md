A modified version of px4 firmware to allow fuzzing, running in a docker container with SITL and Gazebo support. 
With some helper scripts.

## How it works
PX4 firmware source was modified to include a function fuzz_input (`firmware/src/examples/fuzz_input/fuzz_input.c`)
which runs through the module loader `firmware/fuzzing-tools/iris`
fuzz_input continuisly reads input from a FIFO pipe `firmware/fuzzing-tools/pipe` and passes the input to uORB
whicn in turn populates the input buffer to the Mavlink simulator.
The Mavlink simulator expects a struct of type `mavlink_message_t` in the buffer

The current input buffer is limited to size `1024 Bytes` Can be increaded in `fuzz_input.c`.


## Usage
### Build and download the container 

```
git clone https://github.com/wes4m/px4_gazebo.git
cd px4_gazebo
./download_build.sh
```

### Running the image
```
./run
```

### Passing input
```
./mavlink_msg.sh <input>
```
Or just directly write to `firmware/fuzzing-tools/pipe`

Input path: `PX4 > uORB > MAVLINK`

### TODO

* Add fuzzer to container? 
* Test AFL on stdin
* Construct a MavLink dictionary for AFL
