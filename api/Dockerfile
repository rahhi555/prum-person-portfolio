FROM ruby:3.1.2-alpine

ENV RUNTIME_PACKAGES="linux-headers make gcc libc-dev tzdata bash imagemagick postgresql-client libpq-dev vips" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME=/api \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

COPY . ${WORKDIR}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies && \
    rm -f ${HOME}/tmp/pids/server.pid

EXPOSE 3000