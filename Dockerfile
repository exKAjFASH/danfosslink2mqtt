#ARG BUILD_FROM=hassioaddons/base:4.1.1
#ARG BUILD_FROM=raspbian/stretch:latest
# hadolint ignore=DL3006
#FROM ${BUILD_FROM}

FROM resin/raspberry-pi-python:latest

#RUN mkdir /tmp/app

#WORKDIR /tmp/app

COPY . .

RUN  pip install  \
        certifi==2018.11.29 \
        chardet==3.0.4 \
        idna==2.8 \
        paho-mqtt==1.4.0 \
        PyYAML==3.13 \
        requests==2.21.0 \
        urllib3==1.24.1

#CMD [ "run.sh"   ]
CMD [ "python", "-m", "danfosslink2mqtt" ]
