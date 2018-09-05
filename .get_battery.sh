charge_status="$(acpi --battery | cut -d ' ' -f 3)"
percentage="$(acpi --battery | cut -d ' ' -f 4)"
if [ "${charge_status}" == "Charging," ]
then
    echo "+""${percentage::-1}"
else
    echo "-""${percentage::-1}"
fi
