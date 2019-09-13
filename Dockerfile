FROM node:6.10-alpine

RUN apk add --update tini

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json

RUN npm install

RUN npm cache clean --force

COPY . /usr/src/app

EXPOSE 3000

ENTRYPOINT ["/sbin/tini", "--", "node", "./bin/www"]