#!/bin/bash

# decription
echo "This program is made for showing the LAN IP and MAC address of device."

# read device name
device=${1}
if [ "${device}" == "" ]; then
    read -p "Enter your device name:" device
fi

# get informations
ip=($(ifconfig ${device} | grep 'inet '))
if [ $? == 1 ]; then
    echo "device may not exist."
    exit 1
fi
mac=($(ifconfig ${device} | grep 'ether'))

# output
echo "LAN IP address of your device: ${ip[1]}"
echo "MAC address of your device: ${mac[1]}"