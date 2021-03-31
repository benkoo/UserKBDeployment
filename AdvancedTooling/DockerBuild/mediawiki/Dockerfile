FROM mediawiki


# Define the ResourceBasePath in MediaWiki as a variable name: ResourceBasePath
ENV ResourceBasePath /var/www/html


# Make sure that existing software are updated 
RUN apt-get update 
RUN apt-get install -y ghostscript
RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y xpdf
RUN apt-get install -y xvfb
RUN apt-get -y install cron
RUN apt-get -y install nano

RUN rm -rf /var/lib/apt/lists/*

RUN apt-get upgrade

# Define working directory for the following commands
WORKDIR ${ResourceBasePath}/extensions

RUN apt update
RUN apt install -y nodejs npm
RUN git clone https://gerrit.wikimedia.org/r/3d2png
RUN cd 3d2png
RUN npm install

# Copy 3D package to extensions/
COPY ./extensions/3D/ ${ResourceBasePath}/extensions/3D/

# Copy 3DAlloy package to extensions/
COPY ./extensions/3DAlloy/ ${ResourceBasePath}/extensions/3DAlloy/

# Copy StlHandler package to extensions/
COPY ./extensions/StlHandler/ ${ResourceBasePath}/extensions/StlHandler/

# Copy MultimediaViewer package to extensions/
COPY ./extensions/MultimediaViewer/ ${ResourceBasePath}/extensions/MultimediaViewer/

# Copy intersection package to extensions/
COPY ./extensions/intersection/ ${ResourceBasePath}/extensions/intersection/

# Copy PdfHandler package to extensions/
COPY ./extensions/PdfHandler/ ${ResourceBasePath}/extensions/PdfHandler/

# Copy PDFEmbed package to extensions/
COPY ./extensions/PDFEmbed/ ${ResourceBasePath}/extensions/PDFEmbed/

# Copy PDFEmbed package to extensions/
COPY ./extensions/EmbedVideo/ ${ResourceBasePath}/extensions/EmbedVideo/

# Copy the BackupAndRestore scripting package to MediaWiki's "extensions/" directory
COPY ./extensions/BackupAndRestore/ ${ResourceBasePath}/extensions/BackupAndRestore/

# Copy the php.ini with desired upload_max_filesize into the php directory.
ENV PHPConfigurationPath /usr/local/etc/php
COPY ./resources/php.ini ${PHPConfigurationPath}/php.ini

# Copy the $wgLogo image to the container
COPY ./resources/xlp.png ${ResourceBasePath}/resources/assets/xlp.png
# COPY ./resources/xlp.png ${ResourceBasePath}/backup/ToBeUploaded/xlp.png


# Copy the mime.types to the container
COPY ./resources/mime.types ${ResourceBasePath}/includes/mime.types

# Copy the mime.info to the container
COPY ./resources/mime.info ${ResourceBasePath}/includes/mime.info

# The service cron start instruction should be kicked off by the "up.sh" script
# Directly use the following CMD here always cause the MediaWiki service to hang.
# CMD service cron start

# Add crontab file in the cron directory
ADD crontab /var/spool/cron/crontab/root

# Give execution rights on the cron job
RUN chmod 0644 /var/spool/cron/crontab/root