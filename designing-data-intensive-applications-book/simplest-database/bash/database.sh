#!/bin/bash

# Problems with this database
# 1. The database file is a plain text file. We can
# instead store the data in a binary file where the
# data is compressed and optimized for storage and for
# retrievel. Use encoding mechanisms maybe for using
# less disk space to store the same data / same amount
# of data without any data loss. Basically lossless
# compression.
# 2. We cannot use "," in the key or value. But if we
# do then separating key from value would be difficult.
# as each key-value pair is separated by a comma (,)
# to separate key from value or vice versa and show
# which is the key and which is the value.
# 3. We cannot use "\n" in the key or value.  But if we do
# then separating key from value would be difficult and
# separating different pairs of key-value pairs as each
# record (key-value) or key-value pair is separated by
# a new line

# Good things about the database
# 1. Writes are really fast!

db_set() {
    key=$1
    value=$2

    if [ -z $key ]; then
        echo "no key provided"
        exit 1
    fi

    if [ -z $value ]; then
        echo "no value provided"
        exit 1
    fi

    echo "$key,$value" >> database
}

db_get() {
    # # version 1
    # grep "$1," database | tail -n 1 | sed "s/$1,//g"

    # # version 2
    grep "^$1," database | tail -n 1 | sed "s/^$1,//g"

    # # slow variant
    # # slow - since it's replacing a lot of keys with spaces
    # # using sed when we need only one of the values - the
    # # latest value
    # grep "^$1," database | sed "s/^$1,//g" | tail -n 1
}
