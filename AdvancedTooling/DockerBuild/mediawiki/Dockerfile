FROM mediawiki


# Define the ResourceBasePath in MediaWiki as a variable name: ResourceBasePath
ENV ResourceBasePath /var/www/html

# Specify the file name for the DynamicPageList extension package for MediaWiki 1.35
ENV DPLPackageName intersection-REL1_35-f657385.tar.gz

# Define working directory for the following commands
WORKDIR ${ResourceBasePath}/extensions

RUN curl https://extdist.wmflabs.org/dist/extensions/${DPLPackageName} > ${DPLPackageName}
RUN tar -xzf ${DPLPackageName} -C .
RUN rm ${DPLPackageName}

# Make sure that existing software are updated 
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt update 

# Install Ghostscript 
RUN apt-get install -y ghostscript

# RUN apt install --assume-yes php-imagick
RUN apt-get install -y libmagickwand-dev

# Install ImageMagick and its php extensions
# RUN apt-get install php-imagick

# Install xpdf
RUN apt-get install -y xpdf

# Copy PdfHandler package to extensions/
COPY ./extensions/PdfHandler/ ${ResourceBasePath}/extensions/PdfHandler/

# Copy PDFEmbed package to extensions/
COPY ./extensions/PDFEmbed/ ${ResourceBasePath}/extensions/PDFEmbed/

# Copy PDFEmbed package to extensions/
COPY ./extensions/EmbedVideo/ ${ResourceBasePath}/extensions/EmbedVideo/

# Copy the BackupAndRestore scripting package to MediaWiki's "extensions/" directory
COPY ./extensions/BackupAndRestore/ ${ResourceBasePath}/extensions/BackupAndRestore/

# Copy the php.ini with desired upload_max_filesize into the php directory.
COPY ./resources/php.ini /usr/local/etc/php/php.ini

# Copy the $wgLogo image to the container
COPY ./resources/xlp.png ${ResourceBasePath}/resources/assets/xlp.png


# The service cron start instruction should be kicked off by the "up.sh" script
# Directly use the following CMD here always cause the MediaWiki service to hang.
# CMD service cron start