#!/bin/bash

# MIT License
# Copyright (c) 2020 Jack Rayner <me@jrayner.net>


if [[ -z $1 ]] ; then
## TODO: Add validation check using GitHub API for username.
    echo "No username provided"
elif which jq >/dev/null 2>&1; then
    curl -s "https://api.github.com/users/${1}/keys" | jq -r '.[].key'
else
    echo "This script requires JQ to be installed"
fi
