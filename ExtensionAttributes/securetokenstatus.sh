#!/bin/bash
# Get SecureTokenStatus
secureTokenStatus=$(sysadminctl -secureTokenStatus USERNAME 2>&1 | awk '{print$7}')

if [[ $secureTokenStatus == ENABLED ]]; then
      echo "<result>$secureTokenStatus</result>"
  elif [[ $secureTokenStatus == DISABLED ]]; then
      echo "<result>$secureTokenStatus</result>"
  else
      echo "<result>"USERNAME missing"</result>"
fi
