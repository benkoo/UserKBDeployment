#! /bin/bash

# This variable should have the same value as the variable $wgResourceBasePath in LocalSettings.php
ResourceBasePath="/var/www/html"

BackupDir="backup"
ToBeUploaded="ToBeUploaded"


# Check if the ToBeUploaded directory exists
# if [ ! -e $ResourceBasePath/$BackupDir/$ToBeUploaded/ ]
# then
#    echo "Creating the MediaFile directory"
#    mkdir $ResourceBasePath/$BackupDir/$ToBeUploaded/
# fi


# Load images from the ToBeUploaded directory.

if [ -e $ResourceBasePath/$BackupDir/$ToBeUploaded/ ];
then 
   files=$(shopt -s nullglob dotglob; echo $ResourceBasePath/$BackupDir/$ToBeUploaded/*)
   if (( ${#files} ))
   then
    echo $ResourceBasePath/$BackupDir/$ToBeUploaded/" contains files, will try to load them to MediaFiles"
    php $ResourceBasePath/maintenance/importImages.php $ResourceBasePath/$BackupDir/$ToBeUploaded/
    sleep 1
    
    echo "Remove all files from " $ResourceBasePath/$BackupDir/$ToBeUploaded/" directory"
    rm $ResourceBasePath/$BackupDir/$ToBeUploaded/*
   fi

fi
