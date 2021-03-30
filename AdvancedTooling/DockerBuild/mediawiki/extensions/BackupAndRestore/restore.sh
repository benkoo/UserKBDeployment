#! /bin/bash

# This variable should have the same value as the variable $wgResourceBasePath in LocalSettings.php
ResourceBasePath="/var/www/html"

BackupDir="backup"
ToBeUploaded="ToBeUploaded"

# Define the file name format and variable name
FilePrefix="XLP"
FilePostfix=".xml"

# Define the latest literal string
LATEST="LATEST"

# Construct the file name string
FileName=$FilePrefix$LATEST$FilePostfix

echo "Ready to import all textual data from " $ResourceBasePath/$BackupDir/$FileName

php $ResourceBasePath/maintenance/importDump.php < $ResourceBasePath/$BackupDir/$FileName

# Load images from the ToBeUploaded directory.
cd $ResourceBasePath
php $ResourceBasePath/maintenance/importImages.php $ResourceBasePath/$BackupDir/$ToBeUploaded/
