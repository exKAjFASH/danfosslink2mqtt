#ARG BUILD_FROM=hassioaddons/base:4.1.1
#ARG BUILD_FROM=raspbian/stretch:latest
# hadolint ignore=DL3006
#FROM ${BUILD_FROM}

FROM raspbian/stretch:latest

RUN mkdir /tmp/app

WORKDIR /tmp/app

COPY . .

RUN  apk add python3 \
     && python3 -m ensurepip \
     && pip3 install --upgrade pip setuptools \
     && rm -r /usr/lib/python*/ensurepip && \
     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
     if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
     rm -r /root/.cache \
     && pip install  \
        certifi==2018.11.29 \
        chardet==3.0.4 \
        idna==2.8 \
        paho-mqtt==1.4.0 \
        PyYAML==3.13 \
        requests==2.21.0 \
        urllib3==1.24.1

#CMD [ "run.sh"   ]
CMD [ "python", "-m", "danfosslink2mqtt" ]
