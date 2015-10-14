#!/bin/bash

jmeter.sh -n -Jclient.rmi.localport=60000 -Jclient.tries=3 -Jclient.retries_delay=10000 -Jclient.continue_on_fail=true -Djava.rmi.server.hostname=$HOSTNAME "$@"
