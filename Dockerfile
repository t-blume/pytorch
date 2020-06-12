# start from an official image
FROM python:3.8

#open ssl bug
#RUN echo "deb http://httpredir.debian.org/debian/ jessie-backports main" >> /etc/apt/sources.list && \
#  apt update && apt install -y -t jessie-backports openssl

#install OS dependencies
ADD apt_requirements.txt /
RUN apt-get update && apt-get install -y $(cat apt_requirements.txt)


#install python dependencies
RUN python -m pip install --upgrade pip
ADD requirements.txt /tmp

WORKDIR /tmp

RUN pip install -r requirements.txt
