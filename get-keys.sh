#!/bin/bash

# Get GitHub User's public SSH keys

if [[ -z $1 ]] ; then
    echo "No username provided"
elif which jq >/dev/null 2>&1; then
    curl -s "https://api.github.com/users/${1}/keys" | jq -r '.[].key' > keys
else
    echo "This script requires JQ to be installed"
fi
