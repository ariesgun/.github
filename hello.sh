#!/bin/bash

a=([])
echo $a

PER_PAGE=100
PAGE=100
LIST_REPOS=$(curl -s "https://api.github.com/users/ubiqxuity/repos?per_page=${PER_PAGE}&page=${PAGE}")
echo $?
echo "$LIST_REPOS" | jq -r 'type'


if $(echo "$LIST_REPOS" | jq -e 'length == 0' > /dev/null); then
    echo "... $LIST_REPOS"
fi

if [[ "$(echo "$LIST_REPOS" | jq -r 'type')" == "array" ]]; then
    echo "Error: $LIST_REPOS"
    break
fi