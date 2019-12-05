#!/bin/bash
#Extension attribute to determine if the splunkforwarder is currently running. Used to scope a splunk restart command to machines whose splunk forwarders have stopped working.

splunkstatus=$(sudo /Applications/splunkforwarder/bin/splunk status | sed -n '1p' | awk -v FS="(splunkd | running)" '{print $2}')

if [[ $splunkstatus == "is" ]]; then
		echo "<result>Running</result>"
	elif [[ $splunkstatus == "is not" ]]; then
    	echo "<result>Not Running</result>"
	else
		echo "<result>unknown</result>"
fi
