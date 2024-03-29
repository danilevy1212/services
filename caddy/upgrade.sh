#!/usr/bin/env sh

BASEDIR="$(dirname "$0")"
cd "$BASEDIR"

head -n 1 Dockerfile | sed 's|FROM ||' | xargs docker pull
docker compose down
docker compose up -d

cd --
