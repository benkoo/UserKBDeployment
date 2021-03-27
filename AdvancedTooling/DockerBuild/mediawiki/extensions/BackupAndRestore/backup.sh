#! /bin/bash

# This variable should have the same value as the variable $wgResourceBasePath in LocalSettings.php
ResourceBasePath="/var/www/html"

# Define the file name format and variable name
FilePrefix="XLP"
DATE=$(date +"%m-%d-%Y_%H_%M_%S_%Z")
FilePostfix=".xml"

# Construct the file name string
FileName=$FilePrefix$DATE$FilePostfix

# Define the latest literal string
LATEST="LATEST"

# If the XLPDATALATEST.xml doesn't exist in the specified directory, dump all data to the file with that name.
# if [ ! -e $ResourceBasePath/images/$FilePrefix$LATEST$FilePostfix ]; then
# Construct the file name string
FileName=$FilePrefix$LATEST$FilePostfix
# fi

echo "Ready to dump all textual data into " $ResourceBasePath/images/$FileName

php $ResourceBasePath/maintenance/dumpBackup.php --full >$ResourceBasePath/images/$FileName

# Before running the dumpUpLoads.php with the sed instructions, one must first change directory to the /var/www/html location.
cd $ResourceBasePath
php $ResourceBasePath/maintenance/dumpUploads.php    | sed 's~mwstore://local-backend/local-public~./images~'    | xargs cp -t $ResourceBasePath/images/UploadedFiles/
