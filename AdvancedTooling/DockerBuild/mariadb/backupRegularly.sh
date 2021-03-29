#! /bin/bash

# Define the file name format and variable name
FilePrefix="XLP"
DATE=$(date +"%m-%d-%Y_%H_%M")
FilePostfix=".sql.gz"

# Construct the file name string
FileName=$FilePrefix$DATE$FilePostfix

nice -n 19 mysqldump -u wikiuser -p my_wiki --password='example' -c | nice -n 19 gzip -9 > /var/lib/mysql/$FileName
