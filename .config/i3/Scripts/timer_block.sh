#!/bin/bash
if $(task next | grep -q Active); then
    echo "祥$(task next +ACTIVE | awk '{print $2}' | grep min )"
fi
