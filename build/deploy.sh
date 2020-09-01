#!/bin/sh
#
# Deploys to Firebase after symlinking the Cloud Functions
# node_modules dir. Executes in the builder Docker container and
# creates a symlink in the Cloud Build workspace pointing to the
# node_modules directory pre-installed in the container.

set -e

ln -sf /deps/functions/node_modules functions

if [ "$1" != 'auto' -a "$1" != 'tag' ]; then
    echo "Usage: $0 <auto|tag>"
    exit 1
fi

if [ "$1" = 'auto' ]; then
    MESSAGE=$SHORT_SHA
else
    MESSAGE="$TAG_NAME ($SHORT_SHA)"
fi

echo "firebase-tools@$(firebase --version)"

echo firebase --project="$PROJECT_ID" deploy --force --message="$MESSAGE"

firebase --project="$PROJECT_ID" deploy --force --message="$MESSAGE"
