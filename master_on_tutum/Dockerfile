FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 60000

ADD run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
