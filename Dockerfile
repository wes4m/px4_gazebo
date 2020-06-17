FROM pietrodn/px4_gazebo_docker 
# BASE IMAGE MAINTAINER Pietro De Nicolao <powerpdn+dockerpx4@gmail.com>

# Branch of PX4 repo to clone
ENV PX4_BRANCH="stable"
ENV FIRMWARE_DIR="/firmware"

# Change HEADLESS to 0 for gazebo rendering
ENV HEADLESS="1"
ENV CCACHE_DISABLE="1"

WORKDIR ${FIRMWARE_DIR}

# Build px4 with gazebo sim
RUN make posix_sitl_default && make posix_sitl_default sitl_gazebo

EXPOSE 14556/udp
EXPOSE 14557/udp


# Run SITL with gazebo config and input pipe
ENTRYPOINT []
CMD [\
    "Tools/sitl_run.sh",\
    "build/posix_sitl_default/px4",\
    "fuzzing-tools/",\
    "none",\
    "gazebo",\
    "none",\
    ".",\
    "build/posix_sitl_default"\
    ]
