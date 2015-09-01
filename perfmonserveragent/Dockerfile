FROM cirit/oracle-java:latest

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

ENV SERVER_AGENT_VERSION=2.2.1
ENV SERVER_AGENT_HOME=/usr/local/ServerAgent-${SERVER_AGENT_VERSION}
ENV PATH=${SERVER_AGENT_HOME}:${PATH}

RUN apt-get -y update && \
	apt-get -y install \
	wget \
	unzip 

RUN wget http://jmeter-plugins.org/downloads/file/ServerAgent-${SERVER_AGENT_VERSION}.zip && \
	unzip ServerAgent-${SERVER_AGENT_VERSION}.zip -d /usr/local/ServerAgent-${SERVER_AGENT_VERSION}

RUN mv ${SERVER_AGENT_HOME}/lib/libsigar-amd64-linux.so ${SERVER_AGENT_HOME}/lib/libsigar-amd64-linux && \
	rm -rf ServerAgent-${SERVER_AGENT_VERSION}.zip \
			${SERVER_AGENT_HOME}/startAgent.bat \
			${SERVER_AGENT_HOME}/lib/*.dylib \
			${SERVER_AGENT_HOME}/lib/*.dll \
			${SERVER_AGENT_HOME}/lib/*.lib \
			${SERVER_AGENT_HOME}/lib/*.sl \
			${SERVER_AGENT_HOME}/lib/*.so && \
	mv ${SERVER_AGENT_HOME}/lib/libsigar-amd64-linux ${SERVER_AGENT_HOME}/lib/libsigar-amd64-linux.so && \
	apt-get -y remove wget unzip && \
	apt-get -y --purge autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4444

ENTRYPOINT ["startAgent.sh"]
CMD ["--sysinfo"]
