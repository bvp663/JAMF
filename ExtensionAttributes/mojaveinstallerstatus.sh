#!/bin/sh

# Extension Attribute code to isolate the staus of the Mojave installer file deployment
# touched during the installer deployment process
# created 11/09/17

macOS="/var/company/macos.1014.installer"

if [ -f "${macOS}.Pass" ]; then STATUS="Mojave Ready"
elif [ -f "${macOS}.Fail" ]; then STATUS="Mojave Fail"
else
	STATUS="None"
fi

echo "<result>$STATUS</result>"
