FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV EXTRAS_LIBS_SET_VERSION=1.3.0

RUN apt-get -y update && \
	apt-get -y install \
	wget \
	unzip 

RUN wget http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip && \
	unzip -o JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip -d ${JMETER_HOME}

RUN rm -rf JMeterPlugins-ExtrasLibs-${EXTRAS_LIBS_SET_VERSION}.zip && \
	apt-get -y remove wget unzip && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
