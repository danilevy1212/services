#!/usr/bin/env sh

BASEDIR="$(dirname "$0")"
cd "$BASEDIR"

docker compose down
docker compose pull
docker compose up -d

cd --
