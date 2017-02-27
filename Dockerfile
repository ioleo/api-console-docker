FROM nginx:1.10-alpine
MAINTAINER Piotr Gołębiewski "loostro@gmail.com"

RUN apk add --update bash nodejs && rm -rf /var/cache/apk/*
RUN npm install -g bower grunt-cli

WORKDIR /usr/share/nginx/html

ENV API_CONSOLE_VERSION 3.0.13
RUN npm install api-console@$API_CONSOLE_VERSION && mv node_modules/api-console/dist/* . && rm node_modules examples -rf

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENV INDEX_FILE="main.raml" \
    SINGLE_VIEW=false \
    DISABLE_THEME_SWITCHER=true \
    DISABLE_RAML_CLIENT_GENERATOR=false \
    RESOURCES_COLLAPSED=false \
    DOCUMENTATION_COLLAPSED=false \
    ALLOW_UNSAFE_MARKDOWN=false \
    DISABLE_TRY_IT=false

ADD . /usr/share/nginx/html/apis/

ENTRYPOINT ["/opt/entrypoint.sh"]
