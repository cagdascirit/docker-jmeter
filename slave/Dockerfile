FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 1099 60000

VOLUME ["/jmeter"]

ENTRYPOINT jmeter.sh -s -Jserver.rmi.localport=60000 -Djava.rmi.server.hostname=$HOSTNAME -j /jmeter/slave.log 
