#!/bin/bash

# MIT License
# Copyright (c) 2020 Jack Rayner <me@jrayner.net>


if [[ -z $1 ]] ; then
## TODO: Add validation check using GitHub API for username.
    echo "No username provided"
elif which curl >/dev/null 2>&1; then
    curl -s "https://api.github.com/users/${1}/keys" | grep -E '^[[:space:]]*"key"' | cut -d '"' -f 4
elif which wget >/dev/null 2>&1; then
    curl -s "https://api.github.com/users/${1}/keys" | grep -E '^[[:space:]]*"key"' | cut -d '"' -f 4
else
    echo "curl and wget are not available"
    exit 1
fi
