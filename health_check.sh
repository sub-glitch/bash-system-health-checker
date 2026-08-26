#!/bin/bash

exec > >(tee -a /logs/health_check.log)

if [ "$#" -ne 2 ]
 then
    echo "Invalid number of arguments. Please provide a directory path and a threshold value." 
    EXIT_CODE=1
    exit "$EXIT_CODE"
fi

DIRECTORY=$1
THRESHOLD=$2

USER_NAME=$(whoami)
HOSTNAME=$(hostname)
DATE=$(date)
KERNEL_VERSION=$(uname -r)
DISK_USAGE=$(df -h / | awk 'NR > 1 { gsub("%","",$5); print $5 }')
MEMORY_USAGE=$(free -m | awk ' $1 == "Mem:" {print int(($3 / $2) * 100)} ')
EXIT_CODE=0

echo "===================="
echo "[$DATE] System Health Check"
echo "===================="

if [ ! -d "$DIRECTORY" ]
then
    echo "Directory does not exist. Please provide a valid directory path."
    EXIT_CODE=1
    exit "$EXIT_CODE"
fi


if [[ "$THRESHOLD" =~ ^[0-9]+$ ]] && [ "$THRESHOLD" -gt 0 ]
then
    echo "Threshold value: $THRESHOLD"
 else
    echo "Please provide a valid threshold greater than 0."
    EXIT_CODE=1
    exit "$EXIT_CODE"  
fi


check_usage() {
    
    if [ "$1" -gt "$THRESHOLD" ]
    then
        echo "$2 usage: $1%"
        echo "$2 usage is HIGH" 
        EXIT_CODE=1
    else
        echo "$2 usage: $1%"
        echo "$2 usage is OK"  
    fi        
}

echo
echo "Current User: $USER_NAME"


echo
echo "Hostname: $HOSTNAME"


echo
echo "Date: $DATE"


echo
echo "Kernel release: $KERNEL_VERSION"


echo
echo "--- Network ---"
if ping -c 1 google.com &>/dev/null
then
    echo "Internet connectivity sucessful"
else
    echo "Internet connectivity failed"
    EXIT_CODE=1
fi        



echo
echo "--- Storage ---"

check_usage "$DISK_USAGE" "Disk" 


echo
echo "--- Memory ---"

check_usage "$MEMORY_USAGE" "Memory"


exit "$EXIT_CODE"

