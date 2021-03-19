#! /usr/bin/bash

# Define the file name format and variable name
FilePrefix="XLPDATA"
DATE=$(date +"%m-%d-%Y")
FilePostfix=".zip"

# Construct the file name string
FileName=$FilePrefix$DATE$FilePostfix

echo "The Wiki Data set will be back on in the name of: "$FileName

sudo zip -r /data/$FileName /data/initialData
sudo mv /data/$FileName /home/vagrant/data/.
