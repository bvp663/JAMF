#!/bin/bash
# Extension Attribute to track if a caching server is low on space. We have a smart group for the "Low" status that issues an "assetcachemanagerutil flushCache" command to free up space.

# Get amount of storage free for Cache in bytes
cacheFree=$(assetcachemanagerutil status 2>&1 | grep -w "CacheFree" |  grep -o '[0-9]\+' )

# Convert to gigabytes
cacheFree=$(echo "scale=1; $cacheFree/1024/1024/1024" | bc -l)
echo "$cacheFree"

if [[ $cacheFree < 1 ]]; then
      echo "<result>Low - $cacheFree GB</result>"
  elif [[ $cacheFree > 1 ]]; then
      echo "<result>Good - $cacheFree GB</result>"
  else
      echo "<result>unknown</result>"
fi
