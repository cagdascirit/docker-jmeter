FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV STANDART_SET_VERSION=1.3.0

RUN apt-get -y update && \
	apt-get -y install \
	wget \
	unzip 

RUN wget http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-${STANDART_SET_VERSION}.zip && \
	unzip -o JMeterPlugins-Standard-${STANDART_SET_VERSION}.zip -d ${JMETER_HOME}

RUN rm -rf JMeterPlugins-Standard-${STANDART_SET_VERSION}.zip \
			${JMETER_HOME}/lib/ext/*.bat && \
	apt-get -y remove wget unzip && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
