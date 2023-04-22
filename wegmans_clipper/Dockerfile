FROM seleniarm/standalone-firefox as runner

ARG WEGMANS_EMAIL
ARG WEGMANS_PASSWORD
ARG WEGMANS_CRON_SCHEDULE
ARG WEGMANS_CRON_FILE_PATH=/etc/cron.d/wegmans_clipper
ARG WEGMANS_CLIPPER_PROGRAM_PATH=/usr/bin/wegmans_clipper
ENV WEGMANS_CLIPPER_PROGRAM_PATH=${WEGMANS_CLIPPER_PROGRAM_PATH}

USER 0

# Install crond
RUN apt-get update && apt-get -y install cron curl unzip

# Install wegmans_clipper (aarch64)
RUN curl -LJ 'https://github.com/danilevy1212/wegmans_clipper/releases/download/v0.2.0/wegmans_clipper_aarch64_linux' -o ${WEGMANS_CLIPPER_PROGRAM_PATH}
RUN chmod +x ${WEGMANS_CLIPPER_PROGRAM_PATH}

# Create the cron file
RUN echo "# must be ended with a new line \"LF\" (Unix) and not \"CRLF\" (Windows)." >> "${WEGMANS_CRON_FILE_PATH}"
# NOTE  This is pretty unsafe, so don't publish this image!
RUN echo "${WEGMANS_CRON_SCHEDULE} MOZ_HEADLESS=1 RUST_LOG=debug ${WEGMANS_CLIPPER_PROGRAM_PATH} --email ${WEGMANS_EMAIL} --password ${WEGMANS_PASSWORD} --webdriver-command /usr/local/bin/geckodriver --webdriver-args='--binary=/usr/bin/firefox' > /proc/1/fd/1 2>&1" >> "${WEGMANS_CRON_FILE_PATH}"
RUN echo "# An empty line is required at the end of this file for a valid cron file." >> "${WEGMANS_CRON_FILE_PATH}"

# Give execution rights on the cron job
RUN chmod 0644 "${WEGMANS_CRON_FILE_PATH}"

# Apply cron job
RUN crontab "${WEGMANS_CRON_FILE_PATH}"

# Change entrypoint to the cronjob
ENTRYPOINT [ "cron", "-f" ]
