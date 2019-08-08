#!/bin/bash

#Variables
downloadedfilesize=$(stat -f%z /path/to/download/12.4_assetcache.pkg)
correctfilesize=8958068166
PERC=$(bc <<< "scale=2; ($downloadedfilesize/$correctfilesize) * 100");

echo "<result>$PERC%</result>"
