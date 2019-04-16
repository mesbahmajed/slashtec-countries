# Ubuntu Latest with Java 8 installed.
# Build image with:  docker build -t slashtec-airports
FROM ubuntu
MAINTAINER slashtec
RUN apt update && \
    apt upgrade -y && \
    apt install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt install -y oracle-java8-installer
WORKDIR /
ADD countries-assembly-*.jar countries-assembly.jar
EXPOSE 8000
CMD java -jar countries-assembly.jar
