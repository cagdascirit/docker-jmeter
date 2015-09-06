FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV PLUGINS_VERSION=1.3.0

RUN apt-get -y update && \
	apt-get -y install \
	wget \
	unzip 

RUN wget http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-${PLUGINS_VERSION}.zip \
	http://jmeter-plugins.org/downloads/file/JMeterPlugins-Extras-${PLUGINS_VERSION}.zip \
	http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-${PLUGINS_VERSION}.zip \
	http://jmeter-plugins.org/downloads/file/JMeterPlugins-WebDriver-${PLUGINS_VERSION}.zip \
	http://jmeter-plugins.org/downloads/file/JMeterPlugins-Hadoop-${PLUGINS_VERSION}.zip && \
	unzip -o JMeterPlugins-Standard-${PLUGINS_VERSION}.zip -d ${JMETER_HOME} && \
	unzip -o JMeterPlugins-Extras-${PLUGINS_VERSION}.zip -d ${JMETER_HOME} && \
	unzip -o JMeterPlugins-ExtrasLibs-${PLUGINS_VERSION}.zip -d ${JMETER_HOME} && \
	unzip -o JMeterPlugins-WebDriver-${PLUGINS_VERSION}.zip -d ${JMETER_HOME} && \
	unzip -o JMeterPlugins-Hadoop-${PLUGINS_VERSION}.zip -d ${JMETER_HOME}

RUN rm -rf *.zip \
			${JMETER_HOME}/lib/ext/*.bat && \
	apt-get -y remove wget unzip && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
