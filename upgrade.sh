#!/usr/bin/env sh

UPGRADES=""

echo "Services to upgrade:\n"

for FILE in */upgrade.sh; do
    UPGRADES="$FILE $UPGRADES"
    echo "\t$(dirname "$FILE")"
done

echo

for UPGRADE in $UPGRADES; do
    ./"$UPGRADE"
done
