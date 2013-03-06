#!/bin/bash
set -e -u

# Usage:
# import.sh {create|append} OSM_FILE

osm2pgsql \
    --$1 \
    --database=osm \
    --slim \
    --cache=2000 \
    --hstore-all \
    --style=$(dirname $0)/osm2pgsql.style \
    $2
