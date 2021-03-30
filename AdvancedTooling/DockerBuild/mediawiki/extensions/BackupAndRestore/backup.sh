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

# Define the destination of Backup Data
BackupDir="backup"

# If the XLPDATALATEST.xml doesn't exist in the specified directory, dump all data to the file with that name.
# if [ ! -e $ResourceBasePath/images/$FilePrefix$LATEST$FilePostfix ]; then
# Construct the file name string
FileName=$FilePrefix$LATEST$FilePostfix
# fi

echo "Ready to dump all textual data into " $ResourceBasePath/$BackupDir/$FileName

php $ResourceBasePath/maintenance/dumpBackup.php --full >$ResourceBasePath/$BackupDir/$FileName

# Before running the dumpUpLoads.php with the sed instructions, one must first change directory to the /var/www/html location.
cd $ResourceBasePath
php $ResourceBasePath/maintenance/dumpUploads.php    | sed 's~mwstore://local-backend/local-public~./images~'    | cpio cp -t $ResourceBasePath/$BackupDir/MediaFiles/
