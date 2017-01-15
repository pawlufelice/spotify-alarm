FROM resin/rpi-raspbian

# install required packages, in one command
RUN apt-get update  && \
    apt-get install -y  python-dev

ENV PYTHON /usr/bin/python2

# install nodejs for rpi
RUN apt-get install -y wget && \
    wget http://node-arm.herokuapp.com/node_latest_armhf.deb && \
    dpkg -i node_latest_armhf.deb && \
    rm node_latest_armhf.deb && \
    apt-get autoremove -y wget

RUN apt-get install libasound2-dev make build-essential
RUN npm i --save speaker lame spotify-web
COPY . /code
WORKDIR /code
EXPOSE 3000

CMD ["npm start"]
