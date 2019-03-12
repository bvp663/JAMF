#!/bin/sh

# Extension Attribute code to determine status of Ethernet connection
# Created as part of eraseinstall wipe & enroll process to ensure a machine can enroll and pull down policies after the machine is wiped.
# created 3/11/19

ethernetCheck="$(ifconfig -a | grep baseT)"

if [[ -n $ethernetCheck ]]; then STATUS="Active Ethernet"
else
	STATUS="None"
fi
echo "<result>$STATUS</result>"
