#! /bin/bash

# This variable should have the same value as the variable $wgResourceBasePath in LocalSettings.php
ResourceBasePath="/var/www/html"

# Define the file name format and variable name
FilePrefix="XLP"
FilePostfix=".xml"

# Construct the file name string
FileName=$FilePrefix"LATEST"$FilePostfix

backupManyCopies=false
if [ "$backupManyCopies" = true ]
then
    # Identify the current time and assign a string format
    DATE=$(date +"%m-%d-%Y_%H_%M")

    # Construct the file name string
    FileName=$FilePrefix$DATE$FilePostfix
fi

echo "Ready to dump all textual data into " $ResourceBasePath/images/$FileName

nice -n 19 php $ResourceBasePath/maintenance/dumpBackup.php --full --quiet >$ResourceBasePath/images/$FileName

# Before running the dumpUpLoads.php with the sed instructions, one must first change directory to the /var/www/html location.
cd $ResourceBasePath
nice -n 19 php $ResourceBasePath/maintenance/dumpUploads.php    | sed 's~mwstore://local-backend/local-public~./images~'    | xargs cp -t $ResourceBasePath/images/UploadedFiles/