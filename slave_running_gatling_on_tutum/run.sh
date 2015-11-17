#!/bin/bash

jmeter.sh -s -Jserver.rmi.localport=60000 -Djava.rmi.server.hostname=$HOSTNAME "$@"

