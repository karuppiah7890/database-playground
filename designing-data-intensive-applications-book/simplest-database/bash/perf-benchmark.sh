#!/bin/bash

# set -e
# set -x

source ./database.sh

key=${1:-"client$RANDOM"}

while true;
do
    db_set $key $RANDOM
done
