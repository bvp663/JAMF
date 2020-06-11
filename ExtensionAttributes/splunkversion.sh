#!/bin/bash
#Extension attribute to determine version of splunkforwarder

splunkversion=$(find /Applications/splunkforwarder -name "splunkforwarder-*" -print | awk -F '-|-' '{print $2}')
echo "<result>$splunkversion</result>"
