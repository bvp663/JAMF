#!/bin/bash
#Script to restore and update iOS on DEP devices.

#Path of cfgutil is /Applications/Apple\ Configurator\ 2.app/Contents/MacOS/cfgutil 
#Needs to be run as LoggedInUser, wont run as root.

#Resources
#https://configautomation.com/attach-workflow.html

# Set logging
appName="UpgradeRestoreiOS"
appVer="1.0"
appAuthor="Brian Van Peski"
appDepartment="\"
appDate="06/03/2020"
appUpDate="06/03/2020"

mkdir -p /Library/Logs/JAMF
logFile="/Library/Logs/JAMF/${appName}.log"
touch $logFile
chmod 777 $logFile
exec >> $logFile 2>&1


##################################################################################
# Set Variables
##################################################################################
cfgutil="/Applications/Apple Configurator 2.app/Contents/MacOS/cfgutil"
LOGGED_IN_USER=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
LOGGED_IN_UID=$(id -u "$LOGGED_IN_USER")

##################################################################################
# The Needful
##################################################################################
#Update iOS
bin/launchctl asuser "${LOGGED_IN_UID}" sudo -iu "${LOGGED_IN_USER}" "$cfgutil" -f update

#Restore iOS
bin/launchctl asuser "${LOGGED_IN_UID}" sudo -iu "${LOGGED_IN_USER}" "$cfgutil" -f restore
bin/launchctl asuser "${LOGGED_IN_UID}" sudo -iu "${LOGGED_IN_USER}" "$cfgutil" -f pair
bin/launchctl asuser "${LOGGED_IN_UID}" sudo -iu "${LOGGED_IN_USER}" "$cfgutil" -f update install-profile /Library/Application Support/Compay/iOS/Wifi.mobileconfig
bin/launchctl asuser "${LOGGED_IN_UID}" sudo -iu "${LOGGED_IN_USER}" "$cfgutil" -f prepare --dep --skip-language --skip-region
