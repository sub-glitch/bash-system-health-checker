#!/bin/bash

echo "===================="
echo "System Health Check"
echo "===================="


USER_NAME=$(whoami)
HOSTNAME=$(hostname)
DATE=$(date)
KERNEL_VERSION=$(uname -r)
DISK_USAGE=$(df -h / | awk 'NR > 1 { gsub("%","",$5); print $5 }')
MEMORY_USAGE=$(free -m | awk ' $1 == "Mem:" {print int(($3 / $2) * 100)} ')
EXIT_CODE=0

check_usage() {
    
    if [ "$1" -gt 80 ]
    then
        echo "$2 usage: $1%"
        echo "$2 usage is high" 
        EXIT_CODE=1
    else
        echo "$2 usage: $1%"
        echo "$2 usage is okay"  
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
if [ -z "$1" ]
then
    echo "Please provide a directory"
    exit 1
else
    LOG_DIR="$1"

    if [ -d "$LOG_DIR" ]
    then 
    echo "Logs directory exists"
    else
    echo "Logs directory does not exist"
    EXIT_CODE=1
    fi

fi  


echo
echo "--- Storage ---"

check_usage $DISK_USAGE "Disk" 


echo
echo "--- Memory ---"

check_usage $MEMORY_USAGE "Memory"


exit "$EXIT_CODE"

