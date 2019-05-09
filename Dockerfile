FROM debian:stretch

LABEL version='0.0.1'
LABEL maintainer='Francesco Bianco <info@javanile.org>'

COPY entrypoint.sh cat-version /usr/local/bin/

RUN apt-get update \
 && apt-get install -y --no-install-recommends ftp zip unzip openssh-client \
 && apt-get clean \
 && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
 && cd /usr/local/bin \
 && chmod +x entrypoint.sh cat-version \
 && mkdir -p /app

ENTRYPOINT ["entrypoint.sh"]

WORKDIR /app