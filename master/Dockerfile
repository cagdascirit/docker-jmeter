FROM cirit/jmeter:base

MAINTAINER Cagdas Cirit <cagdascirit@gmail.com>

EXPOSE 60000

ENTRYPOINT ["jmeter.sh","-n","-Jclient.rmi.localport=60000","-Jclient.tries=3","-Jclient.retries_delay=10000","-Jclient.continue_on_fail=true"]
