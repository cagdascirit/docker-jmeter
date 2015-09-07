# docker-jmeter
Jmeter Docker Images (Jmeter-base. Jmeter-Master and Jmeter-Slave)

##### Sample Usage for Slave (Jmeter Server):
```sh
$ docker run -d -P --name slave1 -v /Users/cagdas/docker_mnt/:/jmeter_log cirit/jmeter:slave -j /jmeter_log/j3.log
```
##### Sample Usage for Master (Jmeter Client):
```sh
$ docker run -d -P --name master -v /Users/cagdas/docker_mnt/:/jmeter_log --link slave1 --link slave2 --link slave3 cirit/jmeter:master -t /jmeter_log/test.jmx -R slave1,slave2,slave3 -j /jmeter_log/master.log -l /jmeter_log/result.jtl -X
```