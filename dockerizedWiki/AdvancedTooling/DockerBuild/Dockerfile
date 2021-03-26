from mediawiki

# Define the ResourceBasePath in MediaWiki as a variable name: ResourceBasePath
ENV ResourceBasePath /var/www/html

# Specify the file name for the DynamicPageList extension package for MediaWiki 1.35
ENV DPLPackageName intersection-REL1_35-f657385.tar.gz

# Define working directory for the following commands
workdir ${ResourceBasePath}/extensions

RUN curl https://extdist.wmflabs.org/dist/extensions/${DPLPackageName} > ${DPLPackageName}
RUN tar -xzf ${DPLPackageName} -C .
RUN rm ${DPLPackageName}

# Copy the BackupAndRestore scripting package to MediaWiki's "extensions/" directory
COPY ./extensions/BackupAndRestore/ ${ResourceBasePath}/extensions/BackupAndRestore/


# Copy the $wgLogo image to the container
COPY ./resources/xlp.png ${ResourceBasePath}/resources/assets/xlp.png
