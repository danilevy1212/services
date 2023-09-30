FROM arm64v8/caddy:2.7.2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
RUN apk add --update curl
RUN curl 'https://raw.githubusercontent.com/danilevy1212/cv-latex/main/www/en/index.html' -o /srv/index.html
