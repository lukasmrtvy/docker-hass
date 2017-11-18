FROM alpine:3.6

ENV HASS_VERSION 0.57.3

RUN apk add -U --no-cache python3 py3-pip python3-dev tzdata 
    pip3 install --upgrade virtualenv && \
    python3 -m venv $HOME/homeassistant && \
    source $HOME/homeassistant/bin/activate && \
    pip3 install --upgrade homeassistant==${HASS_VERSION}
 
 CMD source $HOME/homeassistant/bin/activate && $HOME/homeassistant/bin/hass
