#!/bin/bash

# Get the current block height
CURRENT_HEIGHT=$(pocket query height | grep ": " | tr -d -c 0-9)
# Get the previous block height
PREVIOUS_HEIGHT=$(cat /home/pocket/.pocket/block_check.txt)

# Verify we have saved the previous height
if [ -z $PREVIOUS_HEIGHT]
then
echo "$CURRENT_HEIGHT > /home/pocket/.pocket/block_check.txt"
quit
fi

# If the block height has not changed restart the service
if ["$CURRENT_HEIGHT" = "$PREVIOUS_HEIGHT"]
then
systemctl stop pocket
sleep 90
systemctl start pocket
sleep 60
NEW_HEIGHT=$(pocket query height | grep ": " | tr -d -c 0-9)
echo "$NEW_HEIGHT" > /home/pocket/.pocket/block_check.txt
else
echo "$CURRENT_HEIGHT" > /home/pocket/.pocket/block_check.txt
fi
quit
