# follows Codeship Node example
# https://documentation.codeship.com/pro/languages-frameworks/nodejs/
FROM cypress/base:8
WORKDIR /app
# Copy our test page and test files
COPY index.html ./
COPY cypress.json ./
COPY package.json ./
COPY cypress ./cypress
