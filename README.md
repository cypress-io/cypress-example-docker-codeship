> Cypress + Docker + Codeship = ❤️

[ ![Codeship Status for cypress-io/cypress-example-docker-codeship](https://app.codeship.com/projects/c989dc20-2399-0135-8805-66761da64e8c/status?branch=master)](https://app.codeship.com/projects/222054) [![Greenkeeper badge](https://badges.greenkeeper.io/cypress-io/cypress-example-docker-codeship.svg)](https://greenkeeper.io/)

Running your Cypress E2E tests on Codeship Pro CI is very simple.
You can either start with a base image
[cypress/base](https://hub.docker.com/r/cypress/base/) with all dependencies.

1. Create test image

Use [Dockerfile](Dockerfile) to build a test image.
If you use `cypress/base` image you would need to install NPM dependencies
that includes Cypress.

```
FROM cypress/base:6
WORKDIR /app
# Copy our test page and test files
COPY index.html ./
COPY cypress.json ./
COPY package.json ./
COPY cypress ./cypress
RUN npm install
```

2. Define Codeship build step

Use [codeship-services.yml](codeship-services.yml) file to
build `cypress/cypress_codeship_test` image (from the above Dockerfile).

```yaml
cypress-codeship-test:
  build:
    image: cypress/cypress_codeship_test
    dockerfile: Dockerfile
```

3. Define test steps

Use [codeship-steps.yml](codeship-steps.yml) file to use the built image
and run one or more E2E tests in parallel or in sequence.

```yaml
- name: "Cypress E2E tests"
  service: cypress-codeship-test
  command: npm run cy:run
```

The `cy:run` command is an NPM script defined in [package.json](package.json)

```json
{
    "scripts": {
        "cy:run": "cypress run"
    }
}
```

Now push the changes to the repo, and watch Codeship run

![Codeship run](screenshots/codeship.png)

## Happy testing

If you find problems with Cypress and CI, please

- consult the [documentation](https://on.cypress.io)
- ask in our [Gitter channel](https://gitter.im/cypress-io/cypress)
- find an existing [issue](https://github.com/cypress-io/cypress/issues)
  or open a new one
