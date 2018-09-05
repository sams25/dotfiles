charge_status="$(acpi --battery | cut -d ' ' -f 3 | tr -d ,%)"
percentage="$(acpi --battery | cut -d ' ' -f 4 | tr -d ,%)"

# Discharging/Full/Charging
if [ "${charge_status}" == "Discharging" ]
then
    echo "-""${percentage}"
else
    echo "+""${percentage}"
fi
