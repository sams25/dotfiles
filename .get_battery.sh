#!/bin/bash
charge_status="$(acpi --battery | cut -d ' ' -f 3 | tr -d ,%)"
percentage="$(acpi --battery | cut -d ' ' -f 4 | tr -d ,%)"

# Discharging/Full/Charging
if [ "${charge_status}" == "Discharging" ]
then
    echo "-""${percentage}"
elif [ "${charge_status}" == "Charging" ]
then
    echo "+""${percentage}"
elif [ "${charge_status}" == "Full" ]
then
    echo "~""${percentage}"
else
    echo "?"
fi
