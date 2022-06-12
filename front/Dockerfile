FROM node:16-alpine

ENV HOME=/front \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR ${HOME}

COPY . .

RUN apk update && npm ci

EXPOSE 80