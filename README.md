# API Console docker image

A [Docker](http://www.docker.io/) image to run the [API Console](https://github.com/mulesoft/api-console) for 
your REST API documentation with [RAML](http://raml.org).

## Installation

### Mounting volume

The image must be run from path containing RAML files or a directory containing such file must be mounted at
`/app/raml`.

### How to run this image

`docker run -p 4000:80 -v $(pwd)/raml:/app/raml -d loostro/api-console:3.0.13`

Then, access it via `http://localhost:4000` in a browser.

### Environment variables

* **MAIN_RAML_PATH** *string*, default: `main.raml`
* **PAGE_TITLE** *string*, default: `API Documentation`

### Options

API Console can be controlled by `/options.conf` file.

The file must be a simple `key=value` configuration, each key accepts string value either `true` or `false`:

* **singleView** default: `false`
* **disableThemeSwitcher** default: `true`
* **disableRamlClientGenerator** default: `true`
* **resourcesCollapsed** default: `true`
* **documentationCollapsed** default: `false`
* **allowUnsafeMarkdown** default: `false`
* **disableTryIt** default: `true`
