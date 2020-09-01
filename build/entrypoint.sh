#!/bin/sh
#
# Docker entrypoint script for running npm commands. Symlinks the
# Angular and Cloud Functions node_modules dirs before running the
# command. Executes in the builder Docker container and creates a
# symlink in the Cloud Build workspace pointing to the node_modules
# directory pre-installed in the container.

ln -sf /deps/node_modules .
ln -sf /deps/functions/node_modules functions
exec "$@"
