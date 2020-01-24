#!/bin/bash
# Extension Attribute to determine if a mac is enrolled in the AppleSeed Beta Program

# Get CatalogURL
CatalogURL=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate.plist CatalogURL)

#Search for customerseed in url
if [[ $CatalogURL =~ "customerseed" ]]; then
      echo "<result>Enrolled</result>"
  else
      echo "<result>Not Enrolled</result>"
fi
