FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN npm install -g firebase-tools && npm install -g @angular/cli

# Install headless Chrome
RUN apt-get install chromium chromium-driver
ENV CHROME_BIN=/usr/bin/chromium-browser
