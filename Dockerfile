FROM alpine:3.6

ENV HASS_VERSION 0.57.3

RUN set -xe && \
    apk add -U --no-cache tzdata python3 && \
    apk add -U --no-cache --virtual .build-dependencies  \
      py3-pip \
      curl \
      musl-dev \
      build-base \
      py3-cffi \
      openssl-dev \
      python3-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      cython \
      eudev-dev \
      jpeg-dev && \
    curl -o /tmp/requirements_all.txt https://raw.githubusercontent.com/home-assistant/home-assistant/${HASS_VERSION}/requirements_all.txt && \
    pip3 install --no-cache-dir -r /tmp/requirements_all.txt && \
    pip3 install --upgrade homeassistant==${HASS_VERSION} && \
    rm -rf /tmp/* && apk del .build-dependencies

EXPOSE 8123

VOLUME /config

CMD hass --config /config
