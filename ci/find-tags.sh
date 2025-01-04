#!/usr/bin/env bash

set -eou pipefail


API_ROUTE="https://hub.docker.com/v2/repositories"
DOCKER_REPOSITORY=islandora
DOCKER_IMAGE=drupal

# get the docker tags and prints as ["3.4", "3.4.1", ..., "3.4.10"]
# so it can be used in a github actions matrix
TAGS=$(curl -s "${API_ROUTE}/${DOCKER_REPOSITORY}/${DOCKER_IMAGE}/tags?page_size=100" \
  | jq -r '
    .results[].name
    | select(test("^[0-9\\.]+$"))
    | select(test("\\."))' \
  | grep -Ev '^(2|3\.[0-3])\.' \
  | jq -c --raw-input --slurp 'split("\n")' \
  | sed 's/""/"main"/g')

# debug step
echo "$TAGS" | jq .

echo "tags=$TAGS" >> "$GITHUB_OUTPUT"
