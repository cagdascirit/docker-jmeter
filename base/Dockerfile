FROM cirit/oracle-java:latest

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV JMETER_VERSION 2.13
ENV JMETER_HOME ${VERSION}u${UPDATE}

RUN apt-get -y update && \
	apt-get -y install wget 

RUN wget http://www.eu.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
	tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local/

RUN rm -rf jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
	apt-get -y remove wget && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME /usr/lib/jvm/jre-${VERSION}-oracle-x64
ENV JRE_HOME ${JAVA_HOME}/jre

ENV LANG       en_US.UTF-8
