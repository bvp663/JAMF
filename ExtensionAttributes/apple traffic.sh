#!/bin/sh

# Extension Attribute code to determine how an iMac or other Apple computer's caching service is connecting to Apple's servers over the network.
# 2018 Brian Van Peski
# Last Update: 11/19/2019

#Get IP address that computer is using to connect to Apple
CacheServerIP=$( assetcachelocatorutil 2>&1 | awk 'FNR == 3 {print}' | awk '{match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}' )

#Getting the first and octet from the IP Address
CacheServerIP=`echo $CacheServerIP | cut -d . -f 1-2`

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

#Array of ZScaler IP Range as of 2018_06 from https://ips.zscalertwo.net/cenr (Updated 2019-11-19)
ZScaler=("1.234" "49.236" "58.220" "64.215" "89.167" "94.188" "104.129" "112.137" "124.248" "154.113" "165.225" "175.45" "185.46" "196.23" "197.98" "197.156" "199.168" "211.144" "213" "221.122");

#If then statement to see if IP matches Company IP range or any of the ZScaler ranges listed in the array
if [[ "$CacheServerIP" == BACKHAULOCTET.* ]] || [[ "$CacheServerIP" == BACKHAUOCTET.* ]]; then
        echo '<result>NetworkBackhaul</result>'
elif in_array ZScaler "$CacheServerIP" ; then
        echo '<result>ZScaler</result>' ; else
echo '<result>LocalEgress</result>'
fi
