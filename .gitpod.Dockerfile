FROM gitpod/workspace-full


USER gitpod

RUN sudo apt-get -q update && \
    sudo apt-get install -yq chromium-browser && \
    sudo rm -rf /var/lib/apt/lists/*

# Install headless Chrome
# RUN apt-get -yq install chromium chromium-driver
# ENV CHROME_BIN=/usr/bin/chromium-browser

# Install custom tools, runtime, etc.
RUN npm install -g firebase-tools && npm install -g @angular/cli
