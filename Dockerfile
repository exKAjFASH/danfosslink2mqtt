#FROM python:3
FROM arm32v7/python:3.7.4-stretch

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

copy . .

RUN pip install -r requirements.txt

CMD [ "python", "-m", "danfosslink2mqtt" ]
