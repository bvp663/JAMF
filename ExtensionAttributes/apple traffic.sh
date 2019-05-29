#!/bin/sh

# Extension Attribute code to determine how an iMac or other Apple computer's caching service is connecting to Apple's servers over the network.
# 2018 Brian Van Peski
# Last Update: 6/12/2018

#Get IP address that computer is using to connect to Apple
CacheServerIP=$( assetcachelocatorutil 2>&1 | awk 'FNR == 3 {print}' | awk '{match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}' )

#Getting the first octet from the IP Address
CacheServerIP=`echo $CacheServerIP | cut -d . -f 1`

#Defining array function to test if first octet is in array of Zscaler IP Address range
in_array() {
    local octet=${1}[@]
    local IP=${2}
    for i in ${!octet}; do
        if [[ ${i} == ${IP} ]]; then
            return 0
        fi
    done
    return 1
}

#Array of ZScaler IP Range as of 2018_06 from https://ips.zscalertwo.net/cenr
ZScaler=("42" "58" "64" "89" "94" "104" "165" "175" "185" "196" "197" "199" "202" "213" "216" "221");

#If then statement to see if IP matches Company IP range or any of the ZScaler ranges listed in the array
if [ "$CacheServerIP" -eq BACKHAULOCTET ] || [ "$CacheServerIP" -eq BACKHAULOCTET ]; then
        echo '<result>NetworkBackhaul</result>'
elif in_array ZScaler "$CacheServerIP" ; then
        echo '<result>ZScaler</result>' ; else
echo '<result>LocalEgress</result>'
fi
