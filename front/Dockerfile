FROM node:16-alpine

ARG DOCKER_ENV

ENV HOME=/front \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    NODE_ENV=${DOCKER_ENV}

WORKDIR ${HOME}

COPY . .

RUN apk update && npm ci

EXPOSE 80