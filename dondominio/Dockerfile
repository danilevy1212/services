FROM ubuntu:latest

ARG DONDOMINIO_USERNAME
ARG DONDOMINIO_API_KEY
ARG DONDOMINIO_BASE_DOMAIN
ARG CRON_SCHEDULE
ARG DONDOMINIO_CRON_FILE_PATH=/etc/cron.d/dondominio_dns
ARG DONDOMINIO_CONF_FILE=/etc/raspi.conf

USER 0

RUN apt-get -y update
RUN apt-get -y install cron wget

RUN wget -O /etc/dondomcli.sh https://raw.githubusercontent.com/dondominio/dondns-bash/master/dondominio/dondomcli.sh
RUN chmod +x /etc/dondomcli.sh

# Create conf file
RUN echo "DDPASSWORD=${DONDOMINIO_API_KEY}" > "${DONDOMINIO_CONF_FILE}"
RUN echo "DDUSER=${DONDOMINIO_USERNAME}" >> "${DONDOMINIO_CONF_FILE}"
RUN echo "DDHOST=raspi.${DONDOMINIO_BASE_DOMAIN}" >> "${DONDOMINIO_CONF_FILE}"

# Create the cron file
RUN echo "# must be ended with a new line \"LF\" (Unix) and not \"CRLF\" (Windows)." > "${DONDOMINIO_CRON_FILE_PATH}"

# Jellyfin
RUN echo "${CRON_SCHEDULE} /etc/dondomcli.sh -c ${DONDOMINIO_CONF_FILE} > /proc/1/fd/1 2>&1" >> "${DONDOMINIO_CRON_FILE_PATH}"
RUN echo "# An empty line is required at the end of this file for a valid cron file." >> "${DONDOMINIO_CRON_FILE_PATH}"

# Give execution rights on the cron job
RUN chmod 0644 "${DONDOMINIO_CRON_FILE_PATH}"

# Apply cron job
RUN crontab "${DONDOMINIO_CRON_FILE_PATH}"

# Change entrypoint to the cronjob
ENTRYPOINT [ "cron", "-f" ]
