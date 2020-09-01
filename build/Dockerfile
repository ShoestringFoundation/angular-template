# Install dependencies and set up for running tests. The lint, unit
# test and e2e test steps are done outside the Dockerfile (in the
# Cloud Build config) so they can be run concurrently.

# Node.js runtime versions:
# https://cloud.google.com/functions/docs/concepts/exec
FROM node:10.22.0-alpine3.9 AS deps
RUN apk add --no-cache chromium chromium-chromedriver
ENV CHROME_BIN=/usr/bin/chromium-browser
# Install Angular deps.
WORKDIR /deps
COPY package.json package-lock.json ./
# Use --unsafe-perm to allow npm postinstall script (ngcc) to run as
# root. https://stackoverflow.com/a/19132229
RUN npm install --unsafe-perm
# Install Firebase CLI and Cloud Functions deps.
RUN npm install -g firebase-tools@^8.0.0
COPY functions/package.json functions/package-lock.json functions/
RUN npm --prefix=functions install
COPY build/deploy.sh build/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh", "sh", "-c"]
