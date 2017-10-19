# follows Codeship Node example
# https://documentation.codeship.com/pro/languages-frameworks/nodejs/
FROM cypress/base:6
RUN node --version
RUN npm --version
WORKDIR /home/node/app
# Copy our test page and test files
COPY index.html cypress.json package.json ./
COPY cypress ./cypress
RUN npm install
