#! /usr/bin/sh

sudo service docker stop

sudo docker-compose --file xlpsystem_config.yml up -d
# wait for a while before replacing the LocalSettings.php
echo waiting for docker to launch and then, replace the  LocalSettings.php
sleep 5
sudo cp LocalSettings.php /data/initialData/mediawiki/.
echo Ready to serve MediaWiki, enjoy.
