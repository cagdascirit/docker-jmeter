FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 1099 60000

COPY gatling_lib/* ${JMETER_HOME}/lib/
COPY modified_jmeter_core/ApacheJMeter_core.jar ${JMETER_HOME}/lib/ext/

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENV JVM_ARGS="-server -Xss10M -XX:+UseThreadPriorities -XX:ThreadPriorityPolicy=42 -Xms512M -Xmx512M -Xmn100M -XX:+HeapDumpOnOutOfMemoryError -XX:+AggressiveOpts -XX:+OptimizeStringConcat -XX:+UseFastAccessorMethods -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv6Addresses=false ${JAVA_OPTS}"

ENTRYPOINT ["/run.sh"]

