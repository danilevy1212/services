FROM lscr.io/linuxserver/jellyfin:latest
    MAINTAINER Daniel Levy <danielmorenolevy@gmail.com>

# yt-dlp
RUN apt-get update && apt-get install -y \
    python3-pip
RUN python3 -m pip install -U yt-dlp
