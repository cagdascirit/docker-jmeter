#!/bin/bash

JMETER_SLAVES=$(printenv | grep -o -P '(?<=1099_TCP_ADDR=).*' | awk '!x[$0]++' ORS=',' | awk '{gsub(/,$/,""); print}')

jmeter.sh -n -Jclient.rmi.localport=60000 -Jclient.tries=3 -Jclient.retries_delay=10000 -Jclient.continue_on_fail=true -Djava.rmi.server.hostname=$HOSTNAME -R $JMETER_SLAVES "$@"
