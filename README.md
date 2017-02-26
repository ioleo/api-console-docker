# API Console docker image

A [Docker](http://www.docker.io/) image to run the [API Console](https://github.com/mulesoft/api-console) for your REST API documentation with [RAML](http://raml.org).

## Installation

### How to run this image

`docker run -p 8080:80-v /raml_dir:/usr/share/nginx/html/apis -d loostro/api-console -v`

Then, access it via `http://localhost:8080` in a browser.

### Options

You can conrol various options via environment variables.

##### INDEX_FILE (default `main.raml`)

Path to API entrypoint relative to mounted volume's root.

##### SINGLE_VIEW (default `false`)

In *Single View* mode you will be able to see only documentation or try-it.

##### DISABLE_THEME_SWITCHER (default `false`)

*Theme Switcher* can be disabled by setting this to `true`.

##### DISABLE_RAML_CLIENT_GENERATOR (default `false`)

*Raml Client Generator* can be disabled by setting this to `true`.

##### RESOURCES_COLLAPSED (default `false`)

Should resources be collapsed by default?

##### ALLOW_UNSAFE_MARKDOWN (default `false`)

Should unsafe Markdown be allowed?

##### DISABLE_TRY_IT (default `false`)

*Try it* can be disabled by setting this to `true`.

