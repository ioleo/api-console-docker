FROM nginx:1.10-alpine
MAINTAINER Piotr Gołębiewski "loostro@gmail.com"

RUN apk add --update bash nodejs && rm -rf /var/cache/apk/*
RUN npm install -g bower grunt-cli

WORKDIR /app

RUN npm install api-console@3.0.13 && mv node_modules/api-console/dist/* . && rm node_modules examples -rf

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ADD /raml /app/raml
ENV MAIN_RAML_PATH="main.raml"

ENTRYPOINT ["/opt/entrypoint.sh"]
