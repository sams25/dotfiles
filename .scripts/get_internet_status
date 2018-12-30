#!/bin/bash

# the success code is 0 (Unix standards)
wifi_success="$(wget -q wttr.in/cambridge -O /dev/null; echo $?)"

if [ "${wifi_success}" == "0" ]
then
    echo ">"
else
    echo "¬"
fi
