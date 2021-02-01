#!/bin/sh

export DATA_DIR="/srv/tmp/data/pitn"

docker run -ti --rm \
        --privileged \
        --user $(id -u):$(id -g) \
        --workdir=$DATA_DIR \
        --volume="/etc/group:/etc/group:ro" \
        --volume="/etc/passwd:/etc/passwd:ro" \
        --volume="/etc/shadow:/etc/shadow:ro" \
        --env QT_GRAPHICSSYSTEM="native" \
        --env DISPLAY=unix$DISPLAY \
        --env NVIDIA_VISIBLE_DEVICES="all" \
        --env NVIDIA_DRIVER_CAPABILITIES="graphics,utility,compute" \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --volume $DATA_DIR:$DATA_DIR \
        --volume $XAUTHORITY:$XAUTHORITY \
        --ipc host \
        --gpus all \
        mysi:latest #dsi_studio

