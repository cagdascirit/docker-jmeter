FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 1099 60000

COPY gatling_lib/* ${JMETER_HOME}/lib/
COPY modified_jmeter_core/ApacheJMeter_core.jar ${JMETER_HOME}/lib/ext/

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
