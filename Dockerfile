# Code maat is written in clojure, but we only need to run the uberjar.
FROM java:8
MAINTAINER Randy Stauner <randy@magnificent-tears.com>

RUN apt-get update \
  && apt-get install -y \
    make \
    git \
    cloc \
    python \
  && rm -rf /var/apt/lists/*

ENV CST_DIR=/usr/src/cst
WORKDIR $CST_DIR

COPY Makefile ./
RUN make

COPY entrypoint ./

# Also add wrapper in $PATH to simplify running a shell in the container.
RUN _ () { \
    echo "#!/bin/sh" > $1; \
    echo "exec $CST_DIR/entrypoint \"\$@\"" >> $1; \
    chmod 0755 $1; \
  }; _ /usr/local/bin/cst

ENTRYPOINT ["/usr/src/cst/entrypoint"]
