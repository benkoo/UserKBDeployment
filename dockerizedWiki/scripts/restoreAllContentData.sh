#! /bin/bash

# This variable should have the same value as the variable $wgResourceBasePath in LocalSettings.php
ResourceBasePath="/var/www/html"

# Define the file name format and variable name
FilePrefix="XLPDATA"
FilePostfix=".xml"

# Define the latest literal string
LATEST="LATEST"

# Construct the file name string
FileName=$FilePrefix$LATEST$FilePostfix

echo "Ready to import all textual data from " $ResourceBasePath/images/$FileName

php $ResourceBasePath/maintenance/importDump.php < $ResourceBasePath/images/$FileName

# Load images from the UploadedFiles location.
cd $ResourceBasePath
php $ResourceBasePath/maintenance/importImages.php $ResourceBasePath/images/UploadedFiles/
