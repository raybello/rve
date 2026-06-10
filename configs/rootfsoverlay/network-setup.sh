#!/bin/sh
# Configure rvenet using player_id from the rve sysfs driver.
# player_id=2 -> server (10.0.0.2), player_id=1 -> client (10.0.0.1)

PLID_FILE=/sys/kernel/rve/player_id

if [ ! -f "$PLID_FILE" ]; then
    echo "rvenet: rve sysfs driver not loaded, skipping network setup"
    exit 0
fi

PLID=$(cat "$PLID_FILE")

ifconfig lo up
ifconfig rvenet 10.0.0.${PLID} netmask 255.255.255.0 up

echo "rvenet: configured as 10.0.0.${PLID}/24 (player_id=${PLID})"
