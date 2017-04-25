#!/bin/bash
#script take from ENV pass and login and write it to auth file

PYTHON="/usr/bin/python"
DELUGED="/usr/bin/deluged"

if [ ! -f $DELUGE_CONFIG_DIR/auth ]; then
    if [ -n $PASSWORD ] && [ -n $LOGIN ]; then
        echo $LOGIN:$PASSWORD:10 >> $DELUGE_CONFIG_DIR/auth
    else
        echo deluge:deluge:10 >> $DELUGE_CONFIG_DIR/auth
        echo "you creditals set to default deluge:deluge\n To change it, create container with ENV vars LOGIN, PASSWORD and set them value"
    fi
fi

$PYTHON $DELUGED -d -c $DELUGE_CONFIG_DIR -L info