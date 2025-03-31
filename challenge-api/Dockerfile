FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -LJ 'https://github.com/danilevy1212/UserPostApi-Challenge/releases/download/v1.0.0/server-arm64' -o server
RUN chmod +x server

EXPOSE ${CHALLENGE_SERVER_PORT}

CMD ["/server"]
