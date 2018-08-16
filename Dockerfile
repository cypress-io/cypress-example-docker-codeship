# follows Codeship Node example
# https://documentation.codeship.com/pro/languages-frameworks/nodejs/

# use Cypress provided image with all dependencies included
FROM cypress/base:10
RUN node --version
RUN npm --version
WORKDIR /home/node/app
# copy our test page and test files
COPY index.html cypress.json package.json package-lock.json ./
COPY cypress ./cypress

# avoid many lines of progress bars during install
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# install NPM dependencies and Cypress binary
RUN npm ci
# check if the binary was installed successfully
RUN $(npm bin)/cypress verify
