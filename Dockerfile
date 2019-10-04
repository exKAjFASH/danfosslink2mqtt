ARG BUILD_FROM=hassioaddons/base:4.1.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN  apk add python \
     && pip3 install  \
        certifi==2018.11.29 \
        chardet==3.0.4 \
        idna==2.8 \
        paho-mqtt==1.4.0 \
        PyYAML==3.13 \
        requests==2.21.0 \
        urllib3==1.24.1


CMD [ "python", "-m", "danfosslink2mqtt" ]
