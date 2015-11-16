FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 1099 60000

COPY gatling_lib/* ${JMETER_HOME}/lib/
COPY modified_jmeter_core/ApacheJMeter_core.jar ${JMETER_HOME}/lib/ext/

ENTRYPOINT ["jmeter.sh","-s","-Jserver.rmi.localport=60000"]
