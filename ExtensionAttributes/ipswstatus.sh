#!/bin/sh

# Extension Attribute code to isolate the staus of IPSW file deployment
# IPSW Packages deployed via JAMF (for iOS 13.4.1 update)

#iOS 13.4.1 Filenames
# iPod Touch 7th Gen - iPodtouch_7_13.4.1_17E262_Restore.ipsw
# iPad Mini 4 and iPad Air 2 - iPad_64bit_TouchID_13.4.1_17E262_Restore.ipsw
# iPad Mini 5 - iPad_Spring_2019_13.4.1_17E262_Restore.ipsw
# iPod Touch 6th Gen - iPodtouch_12.4.6_16G183_Restore.ipsw

IPSWPATH="/Users/{account}/Library/Group Containers/K36BKF7T3D.group.com.apple.configurator/Library/Caches/Firmware/"
FILENAME="iPodtouch_7_13.4.1_17E262_Restore.ipsw"

if [ -f "${IPSWPATH}${FILENAME}" ]; then STATUS="YES"
else
	STATUS="None"
fi

echo "<result>$STATUS</result>"
