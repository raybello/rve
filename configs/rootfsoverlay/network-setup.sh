#!/bin/sh
# Configure rvcnet interface using player_id from the rvc sysfs driver.
# player_id=2 → server (10.0.0.2), player_id=1 → client (10.0.0.1)

PLID_FILE=/sys/kernel/rvc/player_id

if [ ! -f "$PLID_FILE" ]; then
    echo "rvcnet: rvc sysfs driver not loaded, skipping network setup"
    exit 0
fi

PLID=$(cat "$PLID_FILE")

ip link set lo up
ip addr add 10.0.0.${PLID}/24 dev rvcnet
ip link set rvcnet up

echo "rvcnet: configured as 10.0.0.${PLID}/24 (player_id=${PLID})"
