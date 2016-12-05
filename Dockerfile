# Code maat is written in clojure, but we only need to run the uberjar.
FROM java:8
MAINTAINER Randy Stauner <randy@magnificent-tears.com>

ENV APP_DIR=/usr/src/app
WORKDIR $APP_DIR

RUN apt-get update \
  && apt-get install -y \
    make \
    git \
    cloc \
    python \
  && rm -rf /var/apt/lists/*

COPY Makefile ./
RUN make

COPY entrypoint ./

ENTRYPOINT ["/usr/src/app/entrypoint"]
