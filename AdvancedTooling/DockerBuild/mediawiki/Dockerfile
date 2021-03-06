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
WORKDIR ${ResourceBasePath}/extensions/3d2png
RUN npm update
RUN npm upgrade
RUN npm install

# Copy 3D package to extensions/
COPY ./extensions/3D/ ${ResourceBasePath}/extensions/3D/

# Copy Math package to extensions/
COPY ./extensions/Math/ ${ResourceBasePath}/extensions/Math/

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

# Run the cron job
RUN crontab /var/spool/cron/crontab/root

# Go to the ${ResourceBasePath} for working directory
WORKDIR ${ResourceBasePath}

# Install PHP package manager "Composer"

# Requires v1 instead of v2 for compatibility with Semantic MediaWiki 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer --version=1.10.16

# Update mediawiki extensions via composer
RUN echo "{\n\"require\": {\n\"mediawiki/semantic-media-wiki\": \"~3.2\"\n}\n}" > /var/www/html/composer.local.json

# RUN useradd -u 5320 composer 
# USER composer
# RUN composer update --no-dev
# Warning: instsalling semantic mediawiki requires an additional 2GB of storage, it will make
# downloaind terribly slow. Do it with care.
# RUN composer require mediawiki/semantic-media-wiki "~3.2"