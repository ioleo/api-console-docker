FROM nginx:1.10-alpine
MAINTAINER Piotr Gołębiewski "loostro@gmail.com"

RUN apk add --update bash nodejs && rm -rf /var/cache/apk/*
RUN npm install -g bower grunt-cli

WORKDIR /usr/share/nginx/html

ENV API_CONSOLE_VERSION 3.0.13
RUN npm install api-console@$API_CONSOLE_VERSION && mv node_modules/api-console/dist/* . && rm node_modules examples -rf

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ADD . /usr/share/nginx/html/apis/

ENTRYPOINT ["/opt/entrypoint.sh"]
