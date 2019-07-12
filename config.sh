#!/bin/sh
set -e

if [ ! -f /data/server.properties ]; then
    mv /bedrock-server/server.properties /data/
    ln -s /data/server.properties /bedrock-server/server.properties
fi

if [ ! -f /data/permissions.json ]; then
    mv /bedrock-server/permissions.json /data/
    ln -s /data/permissions.json /bedrock-server/permissions.json
fi

if [ ! -f /data/whitelist.json ]; then
    mv /bedrock-server/whitelist.json /data/
    ln -s /data/whitelist.json /bedrock-server/whitelist.json
fi
