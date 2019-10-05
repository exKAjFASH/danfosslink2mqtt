ARG BUILD_FROM=hassioaddons/base-python:3.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#RUN mkdir -p /tmp/app

RUN python3 -m ensurepip

RUN pip3 install --upgrade pip setuptools

RUN rm -r /usr/lib/python*/ensurepip && \
     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
     if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

#WORKDIR /tmp/app

COPY . /

RUN  pip install  \
        certifi==2018.11.29 \
        chardet==3.0.4 \
        idna==2.8 \
        paho-mqtt==1.4.0 \
        PyYAML==3.13 \
        requests==2.21.0 \
        urllib3==1.24.1

CMD [ "run.sh"   ]
