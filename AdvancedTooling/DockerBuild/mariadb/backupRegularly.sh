#! /bin/bash

# Define the file name format and variable name
FilePrefix="XLP"
FilePostfix=".sql.gz"

# Only store the latest
FileName=$FilePrefix"_LATEST"$FilePostfix

backupManyCopies=false
if [ "$backupManyCopies" = true ]
then
    # Identify the current time and assign a string format
    DATE=$(date +"%m-%d-%Y_%H_%M")

    # Construct the file name string
    FileName=$FilePrefix$DATE$FilePostfix
fi



nice -n 19 mysqldump -u wikiuser -p my_wiki --password='example' -c | nice -n 19 gzip -9 > /var/lib/mysql/$FileName
