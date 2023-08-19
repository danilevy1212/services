#!/usr/bin/env sh

BASEDIR="$(dirname "$0")"
cd "$BASEDIR"

docker compose pull
docker compose down
docker compose up -d
sleep 5

cd --
