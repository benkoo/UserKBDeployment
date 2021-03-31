FROM mariadb

# Update the image to the latest software
RUN apt-get update

# Install Cron
RUN apt-get -y install cron

# Install nano editor for potential crontab use
RUN apt-get -y install nano

# Add crontab file in the cron directory
ADD crontab /var/spool/cron/crontab/root

# Give execution rights on the cron job
RUN chmod 0644 /var/spool/cron/crontab/root

ADD backupRegularly.sh /home/backupRegularly.sh

RUN chmod +x /home/backupRegularly.sh

