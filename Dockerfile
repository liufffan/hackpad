from ubuntu:14.04

RUN apt-get -y update

RUN apt-get install -yf \
    openjdk-7-jdk \
    mysql-server \
    scala 

RUN mkdir /etc/hackpad

VOLUME /etc/hackpad/src

COPY bin/docker-entrypoint.sh /etc/hackpad/
COPY . /etc/hackpad/src/

ENTRYPOINT ["/etc/hackpad/docker-entrypoint.sh"]

EXPOSE 5000

CMD ["hackpad"]
