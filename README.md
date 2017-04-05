# API Console docker image

A [Docker](http://www.docker.io/) image to run the [API Console](https://github.com/mulesoft/api-console) for 
your REST API documentation with [RAML](http://raml.org).

## Installation

### Mounting volume

The image must be run from path containing `main.raml` or a directory containing such file must be mounted at
`/app/raml`.

### How to run this image

`docker run -p 4000:80 -v$(pwd)/raml:/app/raml -d loostro/api-console:3.0.13`

Then, access it via `http://localhost:4000` in a browser.

### Options

API Console can be controlled by `/options.conf` file.

The file must be a simple `key=value` configuration and accepts following keys:

* **singleView** (*true|false*, default: `false`)
* **disableThemeSwitcher** (*true|false*, default: `true`)
* **disableRamlClientGenerator** (*true|false*, default: `true`)
* **resourcesCollapsed** (*true|false*, default: `true`)
* **documentationCollapsed** (*true|false*, default: `false`)
* **allowUnsafeMarkdown** (*true|false*, default: `false`)
* **disableTryIt** (*true|false*, default: `true`)
