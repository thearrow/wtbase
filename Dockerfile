FROM python:latest

RUN mkdir -p /app
WORKDIR /app

ADD requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

ADD . /app/
